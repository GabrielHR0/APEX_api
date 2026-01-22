class Api::V1::SocialMediaProfilesController < Api::V1::ApiController
  before_action :set_profile, only: [:show, :update, :destroy]

  def index 
    company_id = params[:company_id]
    #return render json: { error: "company_id parameter is required" }, status: :bad_request unless company_id

    if !company_id
        @profiles = policy_scope(SocialMediaProfile)
    else
      @profiles = Rails.cache.fetch(
        "company:#{company_id}:social_media_profiles",
        expires_in: 10.minutes
      ) do
        SocialMediaProfile.where(company_id: company_id).to_a
      end
    end

    render json: @profiles
  end

  def show
    authorize @profile
    render json: @profile
  end

  def create
    Rails.logger.debug "PARAMS: #{params.to_unsafe_h}"
      
    if params[:company_id]
      @company = Company.find(params[:company_id])
      @profile = @company.social_media_profiles.build(social_media_profile_params)
      authorize @profile
    else
      return render json: { error: "company_id parameter is required" }, status: :bad_request
    end

    if @profile.save
      Rails.cache.delete("company:#{profile.company_id}:social_media_profiles")
      render json: profile, status: :created
    else
      render json: { errors: profile.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    authorize @profile
    if @profile.update(social_media_profile_params)
      Rails.cache.delete("company:#{@profile.company_id}:social_media_profiles")
      render json: @profile
    else
      render json: { errors: @profile.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @profile
    @profile.destroy
    Rails.cache.delete("company:#{@profile.company_id}:social_media_profiles")
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
