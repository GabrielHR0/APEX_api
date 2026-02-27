class Api::V1::HeroBannersController < Api::V1::ApiController
  skip_before_action :authenticate_user!, only: [:index, :show, :active]
  before_action :set_hero_banner, only: %i[show update destroy]

  def index
    @hero_banners = policy_scope(HeroBanner).order(created_at: :desc)
    render json: render_flat(@hero_banners)
  end

  def show
    authorize @hero_banner
    render json: render_flat(@hero_banner)
  end

  def active
    # Sem necessidade de autorização complexa para rota pública
    hero = HeroBanner.active.first
    return head :no_content unless hero

    render json: render_flat(hero)
  end

  def create
    attributes = hero_banner_params
    
    # Padronização Event: Extrai imagem se enviada na raiz
    image_file = params[:hero_banner][:image] || params[:image]
    attributes[:image] = image_file if image_file.present?

    @hero_banner = HeroBanner.new(attributes)
    authorize @hero_banner

    if @hero_banner.save
      ensure_one_active!
      render json: render_flat(@hero_banner), status: :created
    else
      render json: { errors: @hero_banner.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    authorize @hero_banner

    if trying_to_disable_last_active?
      return render json: { 
        errors: ['Não é possível desativar o único Hero Banner existente'] 
      }, status: :unprocessable_entity
    end

    attributes = hero_banner_params
    image_file = params[:hero_banner][:image] || params[:image]
    attributes[:image] = image_file if image_file.present?

    if @hero_banner.update(attributes)
      ensure_one_active!
      render json: render_flat(@hero_banner)
    else
      render json: { errors: @hero_banner.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @hero_banner

    if HeroBanner.count == 1
      return render json: { 
        errors: ['Não é possível excluir o último Hero Banner'] 
      }, status: :unprocessable_entity
    end

    was_active = @hero_banner.active
    @hero_banner.destroy!
    activate_fallback_hero if was_active

    head :no_content
  end

  private

  def set_hero_banner
    @hero_banner = HeroBanner.find(params[:id])
  end

  def hero_banner_params
    params.require(:hero_banner).permit(:title, :description, :active)
  end

  def render_flat(resource)
    serializer = HeroBannerSerializer.new(resource).serializable_hash
    data = serializer[:data]

    if resource.respond_to?(:each)
      data.map { |item| item[:attributes].merge(id: item[:id]) }
    else
      data[:attributes].merge(id: data[:id])
    end
  end

  # --- Lógica de Negócio Mantida ---

  def ensure_one_active!
    active_heroes = HeroBanner.active
    if active_heroes.none?
      HeroBanner.first&.update!(active: true)
    elsif active_heroes.count > 1
      last_active = active_heroes.order(updated_at: :desc).first
      active_heroes.where.not(id: last_active.id).update_all(active: false)
    end
  end

  def trying_to_disable_last_active?
    is_disabling = params.dig(:hero_banner, :active).to_s == "false"
    @hero_banner.active && is_disabling && HeroBanner.count == 1
  end

  def activate_fallback_hero
    HeroBanner.first&.update!(active: true)
  end
end