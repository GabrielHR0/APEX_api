class Api::V1::MembersController < Api::V1::ApiController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_member, only: %i[show update destroy]

  # GET /members
  def index
    members = Member.all
    members = members.active if params[:filter] == 'active'
    members = members.featured if params[:filter] == 'featured'

    members = policy_scope(members).order(full_name: :asc)

    render json: render_flat(members)
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