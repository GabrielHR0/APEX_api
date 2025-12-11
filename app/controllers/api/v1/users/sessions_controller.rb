class Api::V1::Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    token = request.env['warden-jwt_auth.token']

    render json: {
      user: resource.as_json(only: [:id, :email]),
      token: token,
      message: "Login efetuado com sucesso"
    }, status: :ok
  end

  def respond_to_on_destroy
    render json: { message: "Logout efetuado" }, status: :ok
  end
end
