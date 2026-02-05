class Api::V1::EventsController < Api::V1::ApiController
  before_action :set_event, only: [:show, :update, :destroy, :move_up, :move_down, :move_to_position]

  # GET /api/v1/events
  def index
    @events = policy_scope(Event).ordered

    render json: @events.as_json(methods: [ :image_url ])
  end

  # GET /api/v1/events/1
  def show
    authorize @event
    render json: @event.as_json(methods: [ :image_url ])
  end

  # POST /api/v1/events
  def create
    @event = Event.new(event_params)
    authorize @event

    if @event.save
      render json: @event.as_json(methods: [:image_url]),
      status: :created,
      location: api_v1_event_url(@event)
    else
      render json: @event.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /api/v1/events/1
  def update
    authorize @event
    if @event.update(event_params)
      render json: @event.as_json(methods: [:image_url])
    else
      render json: @event.errors, status: :unprocessable_content
    end
  end

  # DELETE /api/v1/events/1
  def destroy
    authorize @event
    @event.destroy
    head :no_content
  end

  def move_up
    authorize @event, :manage?
    new_position = @event.position - 1
    @event.move_to_position(new_position)
    
    # Para API, retorne JSON em vez de redirect
    render json: { 
      message: "Movido para cima", 
      position: @event.reload.position 
    }
  end
  
  def move_down
    authorize @event, :manage?
    new_position = @event.position + 1
    @event.move_to_position(new_position)
    
    render json: { 
      message: "Movido para baixo", 
      position: @event.reload.position 
    }
  end
  
  def move_to_position
    authorize @event, :manage?
    new_position = params[:position].to_i
    @event.move_to_position(new_position)
    
    render json: { 
      message: "Movido para posição #{new_position}", 
      position: @event.reload.position 
    }
  end
  
  def reorder
    authorize Event, :manage?
    params[:order].each_with_index do |id, index|
      Event.where(id: id).update_all(position: index + 1)
    end
    
    head :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:title, :subtitle, :position, :image, :active)
    end

    def image_url_for(attachment)
      return nil unless attachment.attached?
      url_for(attachment)
    end
end
