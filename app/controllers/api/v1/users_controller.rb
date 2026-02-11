class Api::V1::UsersController < Api::V1::ApiController
  before_action :set_user, only: %i[show update destroy]

  def index
    scope = policy_scope(User)
    if params[:search].present?
      scope = scope.where("email ILIKE ?", "%#{params[:search]}%")
    end

    users = scope
              .includes(roles: :permissions)
              .order(created_at: :desc)
              .page(params[:page] || 1)
              .per(params[:per_page] || 10)

    serialized = UserSerializer.new(users).serializable_hash

    render json: {
      users: serialized[:data].map { |u| u[:attributes] },
      meta: {
        current_page: users.current_page,
        total_pages: users.total_pages,
        total_count: users.total_count
      }
    }
  end

  def me
    render json: UserSerializer
                   .new(current_user)
                   .serializable_hash[:data][:attributes]
  end

  def show
    authorize @user

    render json: UserSerializer.new(@user).serializable_hash
  end

  def create
    authorize User

    user = nil

    ActiveRecord::Base.transaction do
      user = User.create!(base_user_params)

      assign_roles!(user) if params.dig(:user, :role_ids)

      user.clear_permission_cache
    end

    render json: UserSerializer.new(user).serializable_hash,
           status: :created

  rescue ActiveRecord::RecordInvalid => e
    render json: { errors: e.record.errors.full_messages },
           status: :unprocessable_entity
  end

    def update
      authorize @user

      if current_user.admin? && current_user.id != @user.id
        admin_password = params[:user][:admin_password_confirmation]
        
        if admin_password.blank? || !current_user.valid_password?(admin_password)
          return render json: { 
            errors: ["Senha de administrador inválida ou não fornecida"] 
          }, status: :unauthorized
        end
    end

    ActiveRecord::Base.transaction do
      @user.update!(base_user_params)

      assign_roles!(@user) if params.dig(:user, :role_ids)

      @user.clear_permission_cache
    end

    render json: UserSerializer.new(@user).serializable_hash

  rescue ActiveRecord::RecordInvalid => e
    render json: { errors: e.record.errors.full_messages },
           status: :unprocessable_entity
  end

  def destroy
    authorize @user
    @user.destroy!
    head :no_content
  end

  def refresh
    ActiveRecord::Base.transaction do
      current_user.rotate_jti! # você já tem esse método 🙂
    end

    new_token, payload = Warden::JWTAuth::UserEncoder.new.call(
      current_user,
      :user,
      nil
    )

    render json: {
      message: "Token atualizado com sucesso",
      token: new_token,
      expires_at: Time.at(payload['exp']).iso8601,
      jti: current_user.jti
    }
  end

  private

  def base_user_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation
    )
  end

  def set_user
    @user = User.find(params[:id])
  end

  def base_user_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation
    )
  end

  def assign_roles!(user)
    role_ids = params[:user][:role_ids]

    roles = Role.where(id: role_ids)

    if roles.size != role_ids.uniq.size
      user.errors.add(:roles, "Uma ou mais roles são inválidas")
      raise ActiveRecord::RecordInvalid.new(user)
    end

    user.roles = roles
  end
end
