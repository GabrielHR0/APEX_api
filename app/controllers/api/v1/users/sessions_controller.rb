class Api::V1::Users::SessionsController < Devise::SessionsController
  include RackSessionFix
  
  # 1. Adicione esta linha aqui
  before_action :configure_sign_in_params, only: [:create]

  respond_to :json

  private

  def respond_with(resource, _opts = {})
    render json: {
      status: { code: 200, message: "Logged in successfully" },
      data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
    }, status: :ok
  end

  def respond_to_on_destroy
    if current_user
      render json: { status: 200, message: "Logged out successfully" }
    else
      render json: { status: 401, message: "Couldn't find an active session." }
    end
  end

  # 2. Adicione este bloco protegido no final
  protected

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end
end