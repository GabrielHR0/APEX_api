class Api::V1::CardsController < ApplicationController
  before_action :set_card, only: [:show, :update, :destroy, :move_up, :move_down, :move_to_position]
  
  def index
    @cards = Card.all
    render json: @cards
  end
  
  def show
    render json: @card
  end
  
  def create
    @card = Card.new(card_params)
    
    if @card.save
      render json: @card, status: :created, location: api_v1_card_url(@card)
    else
      render json: @card.errors, status: :unprocessable_entity
    end
  end
  
  def update
    if @card.update(card_params)
      render json: @card
    else
      render json: @card.errors, status: :unprocessable_entity
    end
  end
  
  def destroy
    @card.destroy
    head :no_content
  end
  
  # Ações de reordenação
  def move_up
    new_position = @card.position - 1
    @card.move_to_position(new_position)
    
    render json: { 
      message: "Card movido para cima", 
      position: @card.reload.position 
    }
  end
  
  def move_down
    new_position = @card.position + 1
    @card.move_to_position(new_position)
    
    render json: { 
      message: "Card movido para baixo", 
      position: @card.reload.position 
    }
  end
  
  def move_to_position
    new_position = params[:position].to_i
    @card.move_to_position(new_position)
    
    render json: { 
      message: "Card movido para posição #{new_position}", 
      position: @card.reload.position 
    }
  end
  
  # Reordenar múltiplos cards de uma vez (para drag and drop)
  def reorder
    frame_id = params[:frame_id]
    
    Card.transaction do
      params[:order].each_with_index do |card_id, index|
        Card.where(id: card_id, carousel_frame_id: frame_id)
            .update_all(position: index + 1)
      end
    end
    
    head :ok
  end
  
  private
  
  def set_card
    @card = Card.find(params[:id])
  end
  
  def card_params
    params.require(:card).permit(:title, :description, :active, :carousel_frame_id, :image, :position)
  end
end