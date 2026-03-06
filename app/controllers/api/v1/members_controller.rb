class Api::V1::MembersController < Api::V1::ApiController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_member, only: %i[show update destroy]

  # GET /members
  def index
    members = policy_scope(Member.all)
    
    # Filtros
    members = members.where(active: true) if params[:filter] == 'active'
    members = members.where(featured: true) if params[:filter] == 'featured'
    
    # Busca por nome, cargo ou email
    if params[:search].present?
      search = "%#{params[:search]}%"
      members = members.where(
        "full_name ILIKE :search OR role ILIKE :search OR email ILIKE :search",
        search: search
      )
    end
    
    members = members.order(full_name: :asc)
    
    # Paginação
    page = (params[:page] || 1).to_i
    per_page = (params[:per_page] || 10).to_i
    total_count = members.count
    total_pages = (total_count.to_f / per_page).ceil
    
    members = members.offset((page - 1) * per_page).limit(per_page)
    
    render json: {
      data: render_flat(members),
      meta: {
        current_page: page,
        total_pages: total_pages,
        total_count: total_count,
        per_page: per_page
      }
    }
  end

  def toggle_featured
    member = Member.find(params[:id])
    authorize member, :update?
    
    new_featured = params.dig(:member, :featured)
    
    # Limitar a 2 membros destacados
    if new_featured && Member.where(featured: true).where.not(id: member.id).count >= 2
      render json: { error: "Máximo de 2 membros destacados permitidos" }, status: :unprocessable_entity
      return
    end
    
    member.update!(featured: new_featured)
    render json: render_flat(member)
  end

  # GET /members/:id
  def show
    authorize @member
    render json: render_flat(@member)
  end

  # POST /members
  def create
    attributes = member_params
    
    image_file = params[:member][:image] || params[:image]
    attributes[:image] = image_file if image_file.present?

    @member = Member.new(attributes)
    authorize @member

    if @member.save
      render json: render_flat(@member), status: :created
    else
      render json: { errors: @member.errors.full_messages },
            status: :unprocessable_entity
    end
  end

  # PATCH/PUT /members/:id
  def update
    authorize @member

    if @member.update(member_params)
      render json: render_flat(@member)
    else
      render json: { errors: @member.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # DELETE /members/:id
  def destroy
    authorize @member

    if @member.destroy
      head :no_content
    else
      render json: { errors: @member.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def count
    authorize Member
    total_members = Member.active.count
    render json: { total_members: total_members }
  end

  private

  def set_member
    @member = Member.find(params[:id])
  end

  def member_params
    params.require(:member).permit(
      :full_name,
      :email,
      :role,
      :phone,
      :active,
      :featured,
      :image,
    )
  end

  def render_flat(resource)
    serializer = MemberSerializer.new(resource).serializable_hash
    data = serializer[:data]

    if resource.respond_to?(:each)
      data.map { |item| item[:attributes].merge(id: item[:id]) }
    else
      data[:attributes].merge(id: data[:id])
    end
  end
end