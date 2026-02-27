class Api::V1::AuditsController < Api::V1::ApiController
  before_action :validate_optional_params, only: [:index, :show]
  before_action :set_resource, only: [:index, :show], if: -> { params[:model].present? && params[:id].present? }

  def index
    authorize :audit, :read?

    @versions = PaperTrail::Version.order(created_at: :desc)

    @versions = @versions.where(item_type: params[:model]) if params[:model].present?
    @versions = @versions.where(item_id: params[:id]) if params[:id].present?
    @versions = @versions.where(event: params[:event_type]) if params[:event_type].present?
    @versions = @versions.where(whodunnit: params[:user_id]) if params[:user_id].present?

    if params[:date_from].present?
      @versions = @versions.where('created_at >= ?', Time.zone.parse(params[:date_from]).beginning_of_day)
    end
    if params[:date_to].present?
      @versions = @versions.where('created_at <= ?', Time.zone.parse(params[:date_to]).end_of_day)
    end

    page = (params[:page] || 1).to_i
    per_page = (params[:per_page] || 25).to_i
    total_count = @versions.count
    @versions = @versions.offset((page - 1) * per_page).limit(per_page)

    user_ids = @versions.pluck(:whodunnit).compact.uniq
    # Remove 'sistema' para não tentar buscar no banco
    user_ids.reject! { |id| id == 'sistema' }
    
    # GARANTINDO QUE A CHAVE É UMA STRING
    users_map = User.where(id: user_ids).index_by { |u| u.id.to_s }

    render json: {
      data: @versions.map { |v| serialize_version(v, users_map) },
      pagination: {
        page: page,
        total_pages: (total_count.to_f / per_page).ceil,
        total_count: total_count
      }
    }
  end

  def show
    authorize :audit, :read?

    if params[:model].present? && params[:id].present?
      @version = @resource.versions.find(params[:version_id])
    else
      @version = PaperTrail::Version.find(params[:version_id])
    end

    render json: serialize_version_detailed(@version)
  end

  private

  def validate_optional_params
    if (params[:model].present? && params[:id].blank?) || (params[:model].blank? && params[:id].present?)
      render json: { error: 'Both model and id parameters are required together, or omit both' }, status: :bad_request
    end
  end

  def set_resource
    begin
      model_class = params[:model].constantize
      @resource = model_class.find(params[:id])
      authorize @resource
    rescue NameError
      render json: { error: "Model '#{params[:model]}' not found" }, status: :bad_request
    rescue ActiveRecord::RecordNotFound
      render json: { error: "#{params[:model]} with id #{params[:id]} not found" }, status: :not_found
    end
  end

  def serialize_version(version, users_map)
    # BUSCANDO PELA STRING
    user = users_map[version.whodunnit.to_s]
    user_name = user ? user.email : "Sistema"

    # Criando a frase descritiva
    action_pt = case version.event
                when 'create' then 'criou'
                when 'update' then 'atualizou'
                when 'destroy' then 'excluiu'
                else version.event
                end
    
    description = "#{user_name} #{action_pt} o registro de #{version.item_type} (ID: #{version.item_id})"

    {
      id: version.id,
      item_type: version.item_type,
      item_id: version.item_id,
      event: version.event,
      created_at: version.created_at,
      user: user ? { id: user.id, email: user.email } : { email: "Sistema", name: "Sistema" },
      description: description,
      changes: version.object_changes.present? ? detailed_changes(version.object_changes) : []
    }
  end

  def serialize_version_detailed(version)
    user = version.whodunnit.present? && version.whodunnit != 'sistema' ? User.find_by(id: version.whodunnit) : nil

    {
      id: version.id,
      event: version.event,
      created_at: version.created_at,
      item_id: version.item_id,
      item_type: version.item_type,
      user: user ? { id: user.id, email: user.email } : { email: "Sistema", name: "Sistema" },
      object: version.object.present? ? JSON.parse(version.object) : {},
      object_changes: version.object_changes,
      changes_detailed: detailed_changes(version.object_changes)
    }
  end

  def detailed_changes(object_changes)
    return {} if object_changes.blank?

    changes = object_changes.is_a?(String) ? JSON.parse(object_changes) : object_changes

    changes.map do |field, values|
      {
        field: field,
        before: values[0],
        after: values[1]
      }
    end
  end
end