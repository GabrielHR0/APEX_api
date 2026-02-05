class Api::V1::LandingPageController < Api::V1::ApiController
  skip_before_action :authenticate_user!, only: :index

  def index
    render json: LandingPageBuilder.call
  end
end