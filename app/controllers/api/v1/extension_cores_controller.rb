class Api::V1::ExtensionCoresController < Api::V1::ApiController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_extension_core, only: %i[show update destroy add_images remove_image remove_icon]

def index
    extension_cores = policy_scope(ExtensionCore).includes(:member, :projects)
    render json: render_flat(extension_cores)
  end

  def show
    authorize @extension_core
    render json: render_flat(@extension_core)
  end

  def create
    @carousel_frame = ExtensionCore.new(extension_core_params_with_images)
    authorize @carousel_frame

    if @carousel_frame.save
      render json: render_flat(@carousel_frame), status: :created
    else
      render json: { errors: @carousel_frame.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    authorize @extension_core
    if @extension_core.update(extension_core_params_with_images)
      render json: render_flat(@extension_core)
    else
      render json: { errors: @extension_core.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @extension_core
    @extension_core.destroy!
    head :no_content
  end

  def remove_icon
    authorize @extension_core
    if @extension_core.icon.present?
      @extension_core.remove_icon!
      @extension_core.save
      render json: { message: 'Ícone removido com sucesso' }
    else
      render json: { error: 'Nenhum ícone encontrado' }, status: :not_found
    end
  end

  def add_images
    authorize @extension_core
    # Caça imagens tanto no root quanto no objeto
    new_images = Array(params[:images] || params.dig(:extension_core, :images))
    
    if new_images.blank?
      return render json: { error: 'Nenhuma imagem fornecida' }, status: :bad_request
    end

    if (@extension_core.images.count + new_images.count) > 2
      return render json: { errors: ["Limite de 2 imagens excedido."] }, status: :unprocessable_entity
    end

    @extension_core.images += new_images
    if @extension_core.save
      render json: { message: 'Sucesso', images: @extension_core.image_urls }
    else
      render json: { errors: @extension_core.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def remove_image
    authorize @extension_core
    image_identifier = params[:image_id]
    remain_images = @extension_core.images
    
    # find the image by filename/identifier
    image_to_remove = remain_images.find { |img| img.identifier == image_identifier || img.filename == image_identifier }
    
    if image_to_remove.nil?
      return render json: { error: 'Imagem não encontrada' }, status: :not_found
    end

    remain_images.delete(image_to_remove)
    @extension_core.images = remain_images

    if @extension_core.save
      render json: { message: 'Imagem removida com sucesso' }
    else
      render json: { error: 'Falha ao remover' }, status: :unprocessable_entity
    end
  end

  private

  def set_extension_core
    @extension_core = ExtensionCore.includes(:member, :projects).find(params[:id])
  end

  def extension_core_params_with_images
    p = params.require(:extension_core).permit(:acronym, :name, :description, :member_id, :icon, { images: [] })
    
    icon_file = params[:extension_core][:icon] || params[:icon]
    p[:icon] = icon_file if icon_file.present?

    images_files = params[:extension_core][:images] || params[:images]
    p[:images] = Array(images_files) if images_files.present?

    p
  end

  def render_flat(resource)
    serializer = ExtensionCoreSerializer.new(resource).serializable_hash
    data = serializer[:data]

    if resource.respond_to?(:each)
      data.map { |item| item[:attributes].merge(id: item[:id]) }
    else
      data[:attributes].merge(id: data[:id])
    end
  end

  def flatten_item(item, included)
    flat = item[:attributes].merge(id: item[:id])
    
    # Mescla os dados do member e projects se existirem no 'included'
    if item[:relationships] && included
      item[:relationships].each do |type, rel_data|
        rel_ids = Array(rel_data[:data]).map { |d| d[:id] }
        flat[type] = included.select { |inc| inc[:type] == type.to_s.singularize.to_sym && rel_ids.include?(inc[:id]) }
                             .map { |inc| inc[:attributes].merge(id: inc[:id]) }
        
        # Se for belongs_to (singular), removemos do array
        flat[type] = flat[type].first if type == :member
      end
    end
    flat
  end
end