class Api::V1::ApiController < ApplicationController
  include Pundit::Authorization

  before_action :authenticate_user!
  before_action :preload_current_user

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def preload_current_user
    return unless current_user

    @current_user ||= User
      .includes(roles: :permissions)
      .find(current_user.id)
  end

  # sobrescreve o helper do Devise
  def current_user
    @current_user || super
  end

  def user_not_authorized
    render json: { error: "Não autorizado." }, status: :forbidden
  end
end
