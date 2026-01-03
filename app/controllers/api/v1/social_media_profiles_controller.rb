class Api::V1::SocialMediaProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :update, :destroy]

  def index
    company_id = params[:company_id]
    return render json: { error: "company_id parameter is required" }, status: :bad_request unless company_id

    profiles = Rails.cache.fetch(
      "company:#{company_id}:social_media_profiles",
      expires_in: 10.minutes
    ) do
      SocialMediaProfile.where(company_id: company_id).to_a
    end

    render json: profiles
  end

  def show
    render json: @profile
  end

  def create
      Rails.logger.debug "PARAMS: #{params.to_unsafe_h}"
      Rails.cache.delete("company:#{profile.company_id}:social_media_profiles") # limpa cache

    if params[:company_id]
      @company = Company.find(params[:company_id])
      profile = @company.social_media_profiles.build(social_media_profile_params)
    else
      return render json: { error: "company_id parameter is required" }, status: :bad_request
    end


    if profile.save
      render json: profile, status: :created
    else
      render json: { errors: profile.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    Rails.cache.delete("company:#{profile.company_id}:social_media_profiles") # limpa cache
    if @profile.update(social_media_profile_params)
      render json: @profile
    else
      render json: { errors: @profile.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    Rails.cache.delete("company:#{profile.company_id}:social_media_profiles") # limpa cache
    @profile.destroy
    render json: { message: "Perfil removido" }, status: :ok
  end

  private

  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_profile
    @profile = SocialMediaProfile.find(params[:id])
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
