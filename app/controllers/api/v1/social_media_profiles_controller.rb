class Api::V1::SocialMediaProfilesController < ApplicationController
  before_action :set_company
  before_action :set_profile, only: [:show, :update, :destroy]

  def index
    render json: @company.social_media_profile
  end

  def show
    render json: @profile
  end

  def create
    profile = @company.social_media_profile.build(social_media_profile_params)

    if profile.save
      render json: profile, status: :created
    else
      render json: { errors: profile.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @profile.update(social_media_profile_params)
      render json: @profile
    else
      render json: { errors: @profile.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @profile.destroy
    render json: { message: "Perfil removido" }, status: :ok
  end

  private

  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_profile
    @profile = @company.social_media_profile.find(params[:id])
  end

  def social_media_profile_params
    params.require(:social_media_profile).permit(
      :platform,
      :url,
      :username,
      :active
    )
  end
end
