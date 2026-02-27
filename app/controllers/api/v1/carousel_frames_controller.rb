class Api::V1::CarouselFramesController < Api::V1::ApiController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_carousel_frame, only: [:show, :update, :destroy, :move_up, :move_down, :move_to_position]

  def index
    authorize CarouselFrame
    @carousel_frames = CarouselFrame.order(position: :asc)

    options = { params: {} }
    
    if params[:include] == 'cards'
      options[:include] = [:cards]
      options[:params][:skip_card_images] = true 
      render json: render_flat(@carousel_frames, options)
    else
      render json: render_flat(@carousel_frames)
    end
  end

  def show
    authorize @carousel_frame
    options = { params: {} }
    
    if params[:include] == 'cards'
      options[:include] = [:cards]
      options[:params][:skip_card_images] = true
      render json: render_flat(@carousel_frame, options)
    else
      render json: render_flat(@carousel_frame)
    end
  end

  def create
    Rails.logger.debug "ARQUIVO PRESENTE: #{params[:carousel_frame][:image].inspect}"
    @carousel_frame = CarouselFrame.new(carousel_frame_params)
    authorize @carousel_frame
    
    if @carousel_frame.save
      render json: render_flat(@carousel_frame), status: :created
    else
      render json: { errors: @carousel_frame.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    authorize @carousel_frame
    if @carousel_frame.update(carousel_frame_params)
      render json: render_flat(@carousel_frame)
    else
      render json: { errors: @carousel_frame.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @carousel_frame
    @carousel_frame.destroy
    head :no_content
  end

  # Métodos de Movimentação (Position)
  def move_up
    authorize @carousel_frame, :manage?
    @carousel_frame.move_to_position(@carousel_frame.position - 1)
    render json: { message: "Movido para cima", position: @carousel_frame.reload.position }
  end

  def move_down
    authorize @carousel_frame, :manage?
    @carousel_frame.move_to_position(@carousel_frame.position + 1)
    render json: { message: "Movido para baixo", position: @carousel_frame.reload.position }
  end

  def move_to_position
    authorize @carousel_frame, :manage?
    @carousel_frame.move_to_position(params[:position].to_i)
    render json: { position: @carousel_frame.reload.position }
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
    @carousel_frame = CarouselFrame.find(params[:id])
  end

  def carousel_frame_params
    params.require(:carousel_frame).permit(:title, :description, :active, :image)
  end

  def render_flat(resource, options = {})
    serializer = CarouselFrameSerializer.new(resource, options).serializable_hash
    data = serializer[:data]

    if resource.respond_to?(:each)
      data.map { |item| flatten_item(item, serializer[:included]) }
    else
      flatten_item(data, serializer[:included])
    end
  end

  def flatten_item(item, included)
    return {} if item.nil?
    
    # Atributos básicos + ID
    flat = item[:attributes].merge(id: item[:id])

    if item[:relationships] && item[:relationships][:cards] && included
      card_ids = item[:relationships][:cards][:data].map { |c| c[:id] }
      
      flat[:cards] = included.select { |inc| inc[:type] == :card && card_ids.include?(inc[:id]) }
                             .map { |inc| inc[:attributes].merge(id: inc[:id]) }
    end

    flat
  end
end