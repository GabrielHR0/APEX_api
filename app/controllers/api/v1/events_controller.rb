class Api::V1::EventsController < Api::V1::ApiController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_event, only: [:show, :update, :destroy, :move_up, :move_down, :move_to_position]

  # GET /events
  def index
    @events = policy_scope(Event).order(:position)
    render json: render_flat(@events)
  end

  # GET /events/:id
  def show
    authorize @event
    render json: render_flat(@event)
  end

  # POST /events
  def create
    attributes = event_params
    
    image_file = params[:event][:image] || params[:image]
    attributes[:image] = image_file if image_file.present?

    @event = Event.new(attributes)
    authorize @event

    if @event.save
      render json: render_flat(@event), status: :created
    else
      render json: { errors: @event.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/:id
  def update
    authorize @event
    
    attributes = event_params
    image_file = params[:event][:image] || params[:image]
    attributes[:image] = image_file if image_file.present?

    if @event.update(attributes)
      render json: render_flat(@event)
    else
      render json: { errors: @event.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /events/:id
  def destroy
    authorize @event
    @event.destroy
    head :no_content
  end

  # Métodos de Movimentação
  def move_up
    authorize @event, :manage?
    @event.move_to_position(@event.position - 1)
    render json: { message: "Movido para cima", position: @event.reload.position }
  end

  def move_down
    authorize @event, :manage?
    @event.move_to_position(@event.position + 1)
    render json: { message: "Movido para baixo", position: @event.reload.position }
  end

  def move_to_position
    authorize @event, :manage?
    new_pos = params[:position].to_i
    @event.move_to_position(new_pos)
    render json: { message: "Movido para posição #{new_pos}", position: @event.reload.position }
  end

  def reorder
    authorize Event, :manage?
    params[:order].each_with_index do |id, index|
      Event.where(id: id).update_all(position: index + 1)
    end
    head :ok
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :subtitle, :position, :image, :active)
  end

  def render_flat(resource)
    serializer = EventSerializer.new(resource).serializable_hash
    data = serializer[:data]

    if resource.respond_to?(:each)
      data.map { |item| item[:attributes].merge(id: item[:id]) }
    else
      data[:attributes].merge(id: data[:id])
    end
  end
end