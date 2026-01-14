class CarouselFrame < ApplicationRecord
  before_validation :set_default_position, on: :create
  after_save :reorder_positions
  after_destroy :reorder_after_destroy
  
  has_one_attached :image
  has_many :cards, dependent: :destroy

  validates :title, :description, presence: true
  validates :position, numericality: { 
    only_integer: true, 
    greater_than_or_equal_to: 1 
  }, allow_nil: true
  
  validate :validate_image
  
  scope :active, -> { where(active: true).order(:position) }
  scope :ordered, -> { order(:position) }
  
  def move_to_position(new_position)
    update(position: new_position)
  end
  
  def swap_position_with(other_frame)
    return if self == other_frame
    
    CarouselFrame.transaction do
      temp_position = position
      update_column(:position, other_frame.position)
      other_frame.update_column(:position, temp_position)
    end
  end
  
  private
  
  def set_default_position
    return if position.present? && position >= 1
    
    max_position = CarouselFrame.maximum(:position) || 0
    self.position = max_position + 1
  end
  
  def reorder_positions
    return unless saved_change_to_position?
    return if position.nil?
    
    # Se a posição for maior que o máximo + 1, ajusta para o máximo + 1
    max_position = CarouselFrame.maximum(:position) || 0
    if position > max_position
      update_column(:position, max_position)
      return
    end
    
    old_position = position_before_last_save
    new_position = position
    
    # Se não tinha posição antes (novo registro), ajusta os outros para baixo
    if old_position.nil?
      CarouselFrame.where("position >= ?", new_position)
                   .where.not(id: id)
                   .update_all("position = position + 1")
      return
    end
    
    # Se a posição mudou, reordena
    return if old_position == new_position
    
    if new_position > old_position
      # Movendo para baixo
      CarouselFrame.where("position > ? AND position <= ?", old_position, new_position)
                   .where.not(id: id)
                   .update_all("position = position - 1")
    else
      # Movendo para cima
      CarouselFrame.where("position >= ? AND position < ?", new_position, old_position)
                   .where.not(id: id)
                   .update_all("position = position + 1")
    end
  end
  
  def reorder_after_destroy
    position_to_fill = position
    
    CarouselFrame.where("position > ?", position_to_fill)
                 .update_all("position = position - 1")
  end
  
  def validate_image  
    return unless image.attached?

    allowed_types = ['image/jpeg', 'image/png', 'image/gif', 'image/webp']
    
    unless allowed_types.include?(image.content_type)
      errors.add(:image, 'A imagem deve ser um arquivo JPG, PNG, JPEG OU WEBP')
    end

    max_size = 5.megabytes
    if image.byte_size > max_size
      errors.add(:image, 'A imagem deve ter no máximo 5MB')
    end
  end
  
  def image_url
    return nil unless image.attached?

    Rails.application.routes.url_helpers.rails_blob_url(
      image,
      only_path: false,
      host: Rails.application.config.action_mailer.default_url_options[:host]
    )
  end
end
