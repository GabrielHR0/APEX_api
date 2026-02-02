class Api::V1::HeroCardsController < Api::V1::ApiController
  before_action :set_hero_card, only: [:show, :update, :destroy, :move_up, :move_down, :move_to_position, ]

  def index
    @hero_cards = policy_scope(HeroCard)
    render json: @hero_cards
  end

  def show
    authorize @hero_card
    render json: @hero_card
  end

  def create
    @hero_card = HeroCard.new(hero_card_params)
    authorize @hero_card
    if @hero_card.save
      render json: @hero_card,
      status: :created,
      location: api_v1_hero_card_url(@hero_card)
    else
      render json: @hero_card.errors, status: :unprocessable_content
    end
  end

  def update
    authorize @hero_card
    if @hero_card.update(hero_card_params)
      render json: @hero_card
    else
      render json: @hero_card.errors, status: :unprocessable_content
    end
  end

  def destroy
    authorize @hero_card
    @hero_card.destroy
    head:no_content
  end

  def move_up
    authorize HeroCard, :manage?
    new_position = @hero_card.position - 1
    @hero_card.move_to_position(new_position)
    
    render json: { 
      message: "Movido para cima", 
      position: @hero_card.reload.position 
    }
  end
  
  def move_down
    authorize HeroCard, :manage?
    new_position = @hero_card.position + 1
    @hero_card.move_to_position(new_position)
    
    render json: { 
      message: "Movido para baixo", 
      position: @hero_card.reload.position 
    }
  end
  
  def move_to_position
    authorize HeroCard, :manage?
    new_position = params[:position].to_i
    @hero_card.move_to_position(new_position)
    
    render json: { 
      message: "Movido para posição #{new_position}", 
      position: @hero_card.reload.position 
    }
  end
  
  def reorder
    authorize HeroCard, :manage?
    params[:order].each_with_index do |id, index|
      HeroCard.where(id: id).update_all(position: index + 1)
    end
    
    head :ok
  end

  private

  def hero_card_params
    params.require(:hero_card).permit(:title, :description, :active )
  end
  
  def set_hero_card
    @hero_card = HeroCard.find(params.expect(:id))
  end
end
