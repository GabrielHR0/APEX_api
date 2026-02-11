class Api::V1::RolesController < Api::V1::ApiController
  before_action :set_role, only: [:update, :destroy, :show]

  def index
      scope = policy_scope(Role).includes(:permissions)
      
      if params[:search].present?
        scope = scope.where("name ILIKE ?", "%#{params[:search]}%")
      end

      roles = scope
                .order(:name)
                .page(params[:page] || 1)
                .per(params[:per_page] || 10)

      render json: {
        roles: RoleSerializer.render_collection(roles),
        meta: {
          current_page: roles.current_page,
          per_page: roles.limit_value,
          total_pages: roles.total_pages,
          total_count: roles.total_count
        }
      }
  end

  def show
    authorize @role

    render json: {
      role: RoleSerializer.render(@role)
    }
  end

  def create
    role = Role.new(role_params)
    authorize role

    role.save!

    render json: {
      role: RoleSerializer.render(role)
    }, status: :created
  end

  def update
    authorize @role
    @role.update!(role_params)

    render json: {
      role: RoleSerializer.render(@role)
    }, status: :created
  end

  def destroy
    authorize @role
    @role.destroy!

    head :no_content
  end

  private

  def set_role
    @role = Role.includes(:permissions).find(params[:id])
  end

  def role_params
    params.require(:role).permit(:name, permission_ids: [])
  end
end
