class ApplicationController < ActionController::API
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized
    render json:{
      status: 403,
      message: "Você não tem permissão para realizar esta ação."
    }, status: :forbidden
  end

  protected

  def user_for_paper_trail
    current_user&.id&.to_s || "sistema"
  end
end