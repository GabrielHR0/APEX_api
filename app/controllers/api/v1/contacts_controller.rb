class Api::V1::ContactsController < Api::V1::ApiController
  before_action :set_contact, only: %i[ show update destroy ]
  
  # Apenas create é público. As estatísticas exigem login (herdado do ApiController)
  skip_before_action :authenticate_user!, only: [:create]
  
  # Filtro de data para as rotas de estatística
  before_action :set_date_range, only: [:summary, :chart_data, :by_status]

  # GET /contacts
  def index
    contacts = policy_scope(Contact)

    # Filtro por status (ex: ?status=disparado)
    contacts = contacts.where(status: params[:status]) if params[:status].present?

    # Filtro por intervalo de datas (ex: ?start_date=2026-01-01&end_date=2026-03-01)
    if params[:start_date].present? || params[:end_date].present?
      start_date = params[:start_date].present? ? Time.zone.parse(params[:start_date]).beginning_of_day : nil
      end_date   = params[:end_date].present?   ? Time.zone.parse(params[:end_date]).end_of_day         : nil

      if start_date && end_date
        contacts = contacts.where(created_at: start_date..end_date)
      elsif start_date
        contacts = contacts.where("created_at >= ?", start_date)
      elsif end_date
        contacts = contacts.where("created_at <= ?", end_date)
      end
    end

    # Busca por nome ou email (ex: ?search=gabriel)
    if params[:search].present?
      search = "%#{params[:search]}%"
      contacts = contacts.where(
        "name ILIKE :search OR email ILIKE :search",
        search: search
      )
    end

    # Ordenação (ex: ?sort=name&direction=asc)
    sort_column = %w[name email status created_at].include?(params[:sort]) ? params[:sort] : 'created_at'
    sort_direction = %w[asc desc].include?(params[:direction]) ? params[:direction] : 'desc'
    contacts = contacts.order(sort_column => sort_direction)

    # Paginação
    page     = (params[:page] || 1).to_i
    per_page = (params[:per_page] || 20).to_i
    total_count = contacts.count
    total_pages = (total_count.to_f / per_page).ceil
    contacts = contacts.offset((page - 1) * per_page).limit(per_page)

    render json: {
      data: render_flat(contacts),
      meta: {
        current_page: page,
        total_pages: total_pages,
        total_count: total_count,
        per_page: per_page
      }
    }
  end

  # GET /contacts/1
  def show
    authorize @contact
    render json: render_flat(@contact)
  end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params)

    # Captura o IP do cliente
    @contact.ip_address = request.remote_ip

    authorize @contact

    if @contact.save
      company_email = Company.first&.email
      @contact.update(status: 'disparado')

      if company_email.present?
        Brevo::SendContactEmail.call(
          contact: @contact,
          company_email: company_email
        )
      else
        Rails.logger.warn 'E-mail da empresa não encontrado'
      end

      render json: @contact, status: :created
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contacts/1
  def update
    authorize @contact
    if @contact.update(contact_params)
      render json: @contact
    else
      render json: @contact.errors, status: :unprocessable_content
    end
  end

  # DELETE /contacts/1
  def destroy
    authorize @contact
    @contact.destroy!
    head :no_content
  end

  # --- NOVAS ROTAS DE ESTATÍSTICA ---

  # GET /api/v1/contacts/summary
  # Retorna totais gerais e quebra por status no período
  def summary
    authorize Contact

    total = filtered_contacts.count
    
    # Ex: { "enviado": 10, "respondido": 5 }
    by_status = filtered_contacts.group(:status).count 

    render json: {
      total_contacts: total,
      status_breakdown: by_status,
      period: { start: @start_date, end: @end_date }
    }
  end

  # GET /api/v1/contacts/chart_data?period=day
  # Gráfico de volume de contatos ao longo do tempo
  def chart_data
    authorize Contact

    period = %w[day month year].include?(params[:period]) ? params[:period] : 'day'
    
    format = case period
             when 'day' then '%Y-%m-%d'
             when 'month' then '%Y-%m'
             when 'year' then '%Y'
             end

    data = filtered_contacts
            .group("DATE_TRUNC('#{period}', created_at)")
            .order("1 ASC")
            .count

    formatted_data = data.map do |date, count|
      {
        date: date.strftime(format),
        original_date: date,
        count: count
      }
    end

    render json: formatted_data
  end

  # GET /api/v1/contacts/by_status
  # Específico para gráficos de Pizza/Donut
  def by_status
    authorize Contact

    data = filtered_contacts
            .group(:status)
            .count

    # Formata para [{ name: "enviado", value: 10 }, ...]
    formatted = data.map { |k, v| { name: k || 'indefinido', value: v } }

    render json: formatted
  end

  private
    
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:name, :email, :message, :status, :ip_address, :sent_at)
    end

    def set_date_range
      # Pega data da URL ou assume últimos 30 dias
      start_param = params[:start_date]
      end_param   = params[:end_date]

      @start_date = start_param.present? ? Time.zone.parse(start_param).beginning_of_day : 30.days.ago.beginning_of_day
      @end_date   = end_param.present? ? Time.zone.parse(end_param).end_of_day : Time.zone.now.end_of_day
    end

    def filtered_contacts
      policy_scope(Contact).where(created_at: @start_date..@end_date)
    end

    def pagination_meta(object)
      {
        current_page: object.current_page,
        total_pages: object.total_pages,
        total_count: object.total_count
      }
    end

    def render_flat(resource)
      serializer = ContactSerializer.new(resource).serializable_hash
      data = serializer[:data]
      if resource.respond_to?(:each)
        data.map { |item| item[:attributes].merge(id: item[:id]) }
      else
        data[:attributes].merge(id: data[:id])
      end
    end
end