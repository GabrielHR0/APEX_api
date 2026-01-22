class Api::V1::CardsController < Api::V1::ApiController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_card, only: [:show, :update, :destroy, :move_up, :move_down, :move_to_position]
  
  def index
    @cards = policy_scope(Card)
    render json: @cards
  end
  
  def show
    authorize @card
    render json: @card
  end
  
  def create
    @card = Card.new(card_params)
    authorize @card
    if @card.save
      render json: @card, status: :created, location: api_v1_card_url(@card)
    else
      render json: @card.errors, status: :unprocessable_entity
    end
  end
  
  def update
    authorize @card
    if @card.update(card_params)
      render json: @card
    else
      render json: @card.errors, status: :unprocessable_entity
    end
  end
  
  def destroy
    authorize @card
    @card.destroy
    head :no_content
  end
  
  # Ações de reordenação
  def move_up
    autorize @card, :manage
    new_position = @card.position - 1
    @card.move_to_position(new_position)
    
    render json: { 
      message: "Card movido para cima", 
      position: @card.reload.position 
    }
  end
  
  def move_down
    autorize @card, :manage
    new_position = @card.position + 1
    @card.move_to_position(new_position)
    
    render json: { 
      message: "Card movido para baixo", 
      position: @card.reload.position 
    }
  end
  
  def move_to_position
    autorize @card, :manage
    new_position = params[:position].to_i
    @card.move_to_position(new_position)
    
    render json: { 
      message: "Card movido para posição #{new_position}", 
      position: @card.reload.position 
    }
  end
  
  # Reordenar múltiplos cards de uma vez (para drag and drop)
  def reorder
    autorize @card, :manage
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