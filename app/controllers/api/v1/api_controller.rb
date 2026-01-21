module Api
  module V1
    class ApiController < ApplicationController
      include Pundit::Authorization
      
      before_action :authenticate_user!

      rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

      private

      def user_not_authorized
        render json: { error: "Não autorizado." }, status: :forbidden
      end
    end
  end
end