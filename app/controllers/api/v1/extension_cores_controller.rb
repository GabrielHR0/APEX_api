class Api::V1::ExtensionCoresController < Api::V1::ApiController
  before_action :set_extension_core, only: %i[show update destroy add_images remove_image remove_icon]

  # GET /extension_cores
  def index
    extension_cores = policy_scope(ExtensionCore)
                        .includes(
                          :member,
                          :projects,
                          images_attachments: :blob,
                          icon_attachment: :blob
                        )

    render json: extension_cores.as_json(
      include: {
        member: {},
        projects: {}
      },
      methods: [:image_urls, :icon_url]
    )
  end

  # GET /extension_cores/:id
  def show
    authorize @extension_core

    render json: @extension_core.as_json(
      include: {
        member: {},
        projects: {}
      },
      methods: [:image_urls, :icon_url]
    )
  end

  # POST /extension_cores
  def create
    extension_core = ExtensionCore.new(extension_core_params)
    authorize extension_core

    extension_core.icon.attach(params[:icon]) if params[:icon].present?

    if params[:images].present?
      params[:images].each { |image| extension_core.images.attach(image) }
    end

    if extension_core.save
      render json: extension_core.as_json(
        include: {
          member: {},
          projects: {}
        },
        methods: [:image_urls, :icon_url]
      ),
      status: :created,
      location: api_v1_extension_core_url(extension_core)
    else
      render json: { errors: extension_core.errors.full_messages },
            status: :unprocessable_entity
    end
  end

  # PATCH/PUT /extension_cores/:id
  def update
    authorize @extension_core

    @extension_core.icon.attach(params[:icon]) if params[:icon].present?

    if params[:images].present?
      params[:images].each { |image| @extension_core.images.attach(image) }
    end

    if @extension_core.update(extension_core_params)
      render json: @extension_core.as_json(
        include: {
          member: {},
          projects: {}
        },
        methods: [:image_urls, :icon_url]
      )
    else
      render json: { errors: @extension_core.errors.full_messages },
            status: :unprocessable_entity
    end
  end

  # DELETE /extension_cores/:id
  def destroy
    authorize @extension_core
    @extension_core.destroy!
    head :no_content
  end

  def remove_icon
    authorize @extension_core

    if @extension_core.icon.attached?
      @extension_core.icon.purge
      
      render json: { 
        message: 'Ícone removido com sucesso'
      }
    else
      render json: { error: 'Nenhum ícone encontrado' }, 
             status: :not_found
    end
  end

  # POST /extension_cores/:id/images
  def add_images
    authorize @extension_core

    if params[:images].blank?
      return render json: { error: 'Nenhuma imagem fornecida' }, status: :bad_request
    end

    # Verifica se adicionar novas imagens excederia o limite
    current_count = @extension_core.images.count
    new_count = params[:images].size
    total_count = current_count + new_count

    if total_count > 2
      return render json: { 
        errors: ["Não é possível adicionar #{new_count} imagem(ns). O núcleo já possui #{current_count} imagem(ns) e o limite é 2."] 
      }, status: :unprocessable_entity
    end

    # Adiciona as imagens
    attached_images = []
    params[:images].each do |image|
      @extension_core.images.attach(image)
      attached_images << {
        id: @extension_core.images.last.id,
        filename: image.original_filename,
        url: url_for(@extension_core.images.last)
      }
    end

    if @extension_core.save
      render json: { 
        message: 'Imagens adicionadas com sucesso',
        images: attached_images,
        current_count: @extension_core.images.count
      }
    else
      render json: { errors: @extension_core.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # DELETE /extension_cores/:id/images/:image_id
  def remove_image
    authorize @extension_core

    attachment = @extension_core.images_attachments.find_by(id: params[:image_id])
    
    if attachment.nil?
      return render json: { error: 'Imagem não encontrada' }, status: :not_found
    end
    
    if attachment.purge
      render json: { 
        message: 'Imagem removida com sucesso',
        current_count: @extension_core.images.count
      }
    else
      render json: { error: 'Não foi possível remover a imagem' }, 
             status: :unprocessable_entity
    end
  end

  private

  def set_extension_core
    @extension_core = ExtensionCore
                        .includes(:member, :projects, images_attachments: :blob, icon_attachment: :blob)
                        .find(params.require(:id))
  end

  def extension_core_params
    params.require(:extension_core).permit(
      :acronym,
      :name,
      :description,
      :member_id
    )
  end
end