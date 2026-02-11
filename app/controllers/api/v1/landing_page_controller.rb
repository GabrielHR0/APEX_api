class Api::V1::LandingPageController < Api::V1::ApiController
  skip_before_action :authenticate_user!, only: :index

  def index
    data = Rails.cache.fetch("landing_page") do
      LandingPageBuilder.call
    end

    render json: data
  end

  def clear_cache
    authorize :cache, :clear?
    Rails.cache.delete("landing_page")

    render json: { message: 'Cache limpo com sucesso' },
      status: :ok
  end
end