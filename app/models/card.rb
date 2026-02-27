class Card < ApplicationRecord
  has_paper_trail
  belongs_to :carousel_frame
  mount_uploader :image, ImageUploader
  
  #has_one_attached :image
  
  validates :title, :description, presence: true
  validates :position, numericality: { 
    only_integer: true, 
    greater_than_or_equal_to: 1 
  }, allow_nil: true
  
  scope :active, -> { where(active: true).order(:position) }
  scope :by_frame, ->(frame_id) { where(carousel_frame_id: frame_id).order(:position) }
  
  # Callbacks para gerenciar posição
  before_validation :set_default_position, on: :create
  after_save :reorder_positions
  after_destroy :reorder_after_destroy
  
  def move_to_position(new_position)
    update(position: new_position)
  end
  
  def move_higher
    return if position <= 1
    move_to_position(position - 1)
  end
  
  def move_lower
    max_position = Card.where(carousel_frame_id: carousel_frame_id).maximum(:position) || 0
    return if position >= max_position
    move_to_position(position + 1)
  end
  
  private
  
  def set_default_position
    return if position.present? && position >= 1
    
    max_position = Card.where(carousel_frame_id: carousel_frame_id).maximum(:position) || 0
    self.position = max_position + 1
  end
  
  def reorder_positions
    return unless saved_change_to_position?
    return unless carousel_frame_id.present? && position.present?
    
    # Se a posição for maior que o máximo + 1, ajusta para o máximo + 1
    max_position = Card.where(carousel_frame_id: carousel_frame_id).maximum(:position) || 0
    if position > max_position
      update_column(:position, max_position)
      return
    end
    
    old_position = position_before_last_save
    new_position = position
    
    # Se não tinha posição antes (novo registro), ajusta os outros para baixo
    if old_position.nil?
      Card.where(carousel_frame_id: carousel_frame_id)
          .where("position >= ?", new_position)
          .where.not(id: id)
          .update_all("position = position + 1")
      return
    end
    
    # Se a posição mudou, reordena
    return if old_position == new_position
    
    if new_position > old_position
      # Movendo para baixo
      Card.where(carousel_frame_id: carousel_frame_id)
          .where("position > ? AND position <= ?", old_position, new_position)
          .where.not(id: id)
          .update_all("position = position - 1")
    else
      # Movendo para cima
      Card.where(carousel_frame_id: carousel_frame_id)
          .where("position >= ? AND position < ?", new_position, old_position)
          .where.not(id: id)
          .update_all("position = position + 1")
    end
  end
  
  def reorder_after_destroy
    position_to_fill = position
    
    Card.where(carousel_frame_id: carousel_frame_id)
        .where("position > ?", position_to_fill)
        .update_all("position = position - 1")
  end
  
  def image_url
    image.present? ? image.url : nil
  end
end
