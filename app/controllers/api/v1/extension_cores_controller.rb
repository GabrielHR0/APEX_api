class Api::V1::ExtensionCoresController < Api::V1::ApiController
  before_action :set_extension_core, only: [:show, :update, :destroy]

  # GET /extension_cores
  def index
    @extension_cores = policy_scope(ExtensionCore)

    render json: @extension_cores
  end

  # GET /extension_cores/1
  def show
    authorize @extension_core
    render json: @extension_core
  end

  # POST /extension_cores
  def create
    @extension_core = ExtensionCore.new(extension_core_params)
    authorize @extension_core
    if @extension_core.save
      render json: @extension_core, status: :created, location: api_v1_extension_core_url(@extension_core)
    else
      render json: @extension_core.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /extension_cores/1
  def update
    authorize @extension_core
    if @extension_core.update(extension_core_params)
      render json: @extension_core
    else
      render json: @extension_core.errors, status: :unprocessable_content
    end
  end

  # DELETE /extension_cores/1
  def destroy
    authorize @extension_core
    @extension_core.destroy!
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_extension_core
      @extension_core = ExtensionCore.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def extension_core_params
      params.expect(extension_core: [ :acronym, :name, :description, :director_name, :director_email ])
    end
end
