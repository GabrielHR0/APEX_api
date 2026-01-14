class Api::V1::HeroCardsController < ApplicationController

  def index
    @hero_cards = HeroCard.all
    render json: @hero_cards
  end

  def show
    render json: @hero_card
  end

  def create
    @hero_card = HeroCard.new(hero_card_params)

    if @hero_card.save
      render json: @hero_card,
      status: :created,
      location: api_v1_hero_card_url(@hero_card)
    else
      render json: @hero_card.errors, status: :unprocessable_content
    end
  end

  def update
    if @hero_card.update(hero_card_params)
      render json: @hero_card
    else
      render json: @hero_card.errors, status: :unprocessable_content
    end
  end

  def destroy
    @hero_card.destroy
    head:no_content
  end

  def move_up
    new_position = @hero_card.position - 1
    @hero_card.move_to_position(new_position)
    
    # Para API, retorne JSON em vez de redirect
    render json: { 
      message: "Movido para cima", 
      position: @hero_card.reload.position 
    }
  end
  
  def move_down
    new_position = @hero_card.position + 1
    @hero_card.move_to_position(new_position)
    
    render json: { 
      message: "Movido para baixo", 
      position: @hero_card.reload.position 
    }
  end
  
  def move_to_position
    new_position = params[:position].to_i
    @hero_card.move_to_position(new_position)
    
    render json: { 
      message: "Movido para posição #{new_position}", 
      position: @hero_card.reload.position 
    }
  end
  
  def reorder
    params[:order].each_with_index do |id, index|
      HeroCard.where(id: id).update_all(position: index + 1)
    end
    
    head :ok
  end

  private

  def hero_card_params
    params.require(:hero_card).permit(:title, :description, :active )
  end
  
  def set_hero_car
    @hero_card = HeroCard.find(params.expect(:id))
  end
end
