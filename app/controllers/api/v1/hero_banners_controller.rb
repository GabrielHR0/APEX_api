class Api::V1::HeroBannersController < Api::V1::ApiController
  before_action :set_hero_banner, only: %i[show update destroy]

  # GET /hero_banners
  def index
    hero_banners = policy_scope(HeroBanner)

    render json: hero_banners.as_json(methods: [:image_url])
  end

  # GET /hero_banners/:id
  def show
    authorize @hero_banner

    render json: @hero_banner.as_json(methods: [:image_url])
  end

  # GET /hero_banners/active
  def active
    authorize HeroBanner, :active?

    hero = policy_scope(HeroBanner).active.first
    return head :no_content unless hero

    render json: hero.as_json(methods: [:image_url])
  end

  # POST /hero_banners
  def create
    hero = HeroBanner.new(hero_banner_params)
    authorize hero

    if hero.save
      ensure_one_active!
      render json: hero.as_json(methods: [:image_url]),
             status: :created,
             location: api_v1_hero_banner_url(hero)
    else
      render json: { errors: hero.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hero_banners/:id
  def update
    authorize @hero_banner

    if trying_to_disable_last_active?
      return render json: {
        errors: ['Não é possível desativar o único Hero Banner existente']
      }, status: :unprocessable_entity
    end

    if @hero_banner.update(hero_banner_params)
      ensure_one_active!
      render json: @hero_banner.as_json(methods: [:image_url])
    else
      render json: { errors: @hero_banner.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # DELETE /hero_banners/:id
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
    @hero_banner = HeroBanner.find(params.expect(:id))
  end

  def hero_banner_params
    params.expect(
      hero_banner: [
        :title,
        :description,
        :active,
        :image
      ]
    )
  end

  # 🔒 Garante que sempre exista UM ativo
  def ensure_one_active!
    active_heroes = HeroBanner.active

    if active_heroes.count.zero?
      HeroBanner.first&.update!(active: true)
    elsif active_heroes.count > 1
      last_active = active_heroes.order(updated_at: :desc).first
      active_heroes.where.not(id: last_active.id).update_all(active: false)
    end
  end

  def trying_to_disable_last_active?
    @hero_banner.active &&
      hero_banner_params.key?(:active) &&
      ActiveModel::Type::Boolean.new.cast(hero_banner_params[:active]) == false &&
      HeroBanner.active.count == 1
  end

  def activate_fallback_hero
    fallback = HeroBanner.first
    fallback&.update!(active: true)
  end
end
