class Api::V1::ExtensionCoresController < ApplicationController
  before_action :set_extension_core, only: [ show, update, destroy ]

  # GET /extension_cores
  def index
    @extension_cores = ExtensionCore.all

    render json: @extension_cores
  end

  # GET /extension_cores/1
  def show
    render json: @extension_core
  end

  # POST /extension_cores
  def create
    @extension_core = ExtensionCore.new(extension_core_params)

    if @extension_core.save
      render json: @extension_core, status: :created, location: api_v1_extension_core_url(@extension_core)
    else
      render json: @extension_core.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /extension_cores/1
  def update
    if @extension_core.update(extension_core_params)
      render json: @extension_core
    else
      render json: @extension_core.errors, status: :unprocessable_content
    end
  end

  # DELETE /extension_cores/1
  def destroy
    @extension_core.destroy!
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
