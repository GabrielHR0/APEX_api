class Api::V1::CarouselFramesController < Api::V1::ApiController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_carousel_frame, only: [:show, :update, :destroy, :move_up, :move_down, :move_to_position]

  def index
    authorize CarouselFrame
    if params[:include] == 'cards'
      @carousel_frames = CarouselFrame
                          .includes(:cards)
                          .order(position: :asc)
                          .with_attached_image 
      
      card_ids = @carousel_frames.map { |frame| frame.cards.pluck(:id) }.flatten
      cards_with_images = Card.with_attached_image.where(id: card_ids)
      cards_by_id = cards_with_images.index_by(&:id)

      render json: with_cards_optimized(@carousel_frames, cards_by_id)
    else
      @carousel_frames = CarouselFrame.all.with_attached_image
      render json: @carousel_frames.as_json(
        methods: [:image_url]
      )
    end
  end
  
  def show
    authorize @carousel_frame
    if params[:include] == 'cards'
      @carousel_frame = CarouselFrame
                        .includes(cards: { image_attachment: :blob })
                        .with_attached_image
                        .find(params[:id])
      render json: @carousel_frame.as_json(
        include: {
          cards: {
            methods: [:image_url]
          }
        },
        methods: [:image_url]
      )
    else
      render json: @carousel_frame.as_json(methods: [:image_url])
    end
  end

  def create
    @carousel_frame = CarouselFrame.new(carousel_frame_params)
    authorize @carousel_frame
    if @carousel_frame.save
      render json: @carousel_frame.as_json(methods: [:image_url]), 
             status: :created,
             location: api_v1_carousel_frame_url(@carousel_frame)
    else
      render json: @carousel_frame.errors, status: :unprocessable_entity
    end
  end

  def update
    authorize @carousel_frame
    if @carousel_frame.update(carousel_frame_params)
      render json: @carousel_frame.as_json(methods: [:image_url])
    else
      render json: @carousel_frame.errors, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @carousel_frame
    @carousel_frame.destroy
    head :no_content
  end

  def move_up
    authorize @carousel_frame, :manage?
    new_position = @carousel_frame.position - 1
    @carousel_frame.move_to_position(new_position)
    
    # Para API, retorne JSON em vez de redirect
    render json: { 
      message: "Movido para cima", 
      position: @carousel_frame.reload.position 
    }
  end
  
  def move_down
    authorize @carousel_frame, :manage?
    new_position = @carousel_frame.position + 1
    @carousel_frame.move_to_position(new_position)
    
    render json: { 
      message: "Movido para baixo", 
      position: @carousel_frame.reload.position 
    }
  end
  
  def move_to_position
    authorize @carousel_frame, :manage?
    new_position = params[:position].to_i
    @carousel_frame.move_to_position(new_position)
    
    render json: { 
      message: "Movido para posição #{new_position}", 
      position: @carousel_frame.reload.position 
    }
  end
  
  def reorder
    authorize CarouselFrame, :manage?
    params[:order].each_with_index do |id, index|
      CarouselFrame.where(id: id).update_all(position: index + 1)
    end
    
    head :ok
  end

  private

  def set_carousel_frame
    @carousel_frame = CarouselFrame.with_attached_image.find(params[:id])
  end

  def carousel_frame_params
    params.require(:carousel_frame).permit(:title, :description, :active, :image)
  end

  def with_cards_optimized(frames, cards_by_id)
    frame_ids = frames.map(&:id)
    
    sorted_cards = Card
                   .where(carousel_frame_id: frame_ids)
                   .order(:carousel_frame_id, :position)
                   .group_by(&:carousel_frame_id)
    
    frames.map do |frame|
      frame_cards = sorted_cards[frame.id] || []
      
      {
        id: frame.id,
        title: frame.title,
        description: frame.description,
        active: frame.active,
        image_url: frame.image.attached? ? url_for(frame.image) : nil,
        position: frame.position,  # Adicione esta linha
        created_at: frame.created_at,
        updated_at: frame.updated_at,
        cards: frame_cards.map do |card|
          card_with_image = cards_by_id[card.id] || card
          {
            id: card.id,
            title: card.title,
            description: card.description,
            position: card.position,
            active: card.active,
            image_url: card_with_image.image.attached? ? url_for(card_with_image.image) : nil,
            created_at: card.created_at,
            updated_at: card.updated_at
          }
        end
      }
    end
  end
  
  def image_url_for(attachment)
    return nil unless attachment.attached?
    url_for(attachment)
  end
end