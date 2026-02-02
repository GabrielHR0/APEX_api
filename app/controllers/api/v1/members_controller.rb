class Api::V1::MembersController < Api::V1::ApiController
  before_action :set_member, only: %i[show update destroy]

  # GET /members
  def index
    members = policy_scope(Member)

    render json: members.as_json(methods: [:image_url])
  end

  # GET /members/:id
  def show
    authorize @member

    render json: @member.as_json(methods: [:image_url])
  end

  # POST /members
  def create
    member = Member.new(member_params)
    authorize member

    if member.save
      render json: member.as_json(methods: [:image_url]),
             status: :created,
             location: api_v1_member_url(member)
    else
      render json: { errors: member.errors.full_messages },
             status: :unprocessable_content
    end
  end

  # PATCH/PUT /members/:id
  def update
    authorize @member

    if @member.update(member_params)
      render json: @member.as_json(methods: [:image_url])
    else
      render json: { errors: @member.errors.full_messages },
             status: :unprocessable_content
    end
  end

  # DELETE /members/:id
  def destroy
    authorize @member

    if @member.destroy
      head :no_content
    else
      render json: { errors: @member.errors.full_messages },
             status: :unprocessable_content
    end
  end

  private

  def set_member
    @member = Member.find(params.expect(:id))
  end

  def member_params
    params.require(:member).permit(
      :full_name,
      :email,
      :role,
      :phone,
      :active,
      :image
    )
  end
end
