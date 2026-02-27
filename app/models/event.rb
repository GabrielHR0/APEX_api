class Event < ApplicationRecord
  has_paper_trail

  before_validation :set_default_position, on: :create
  after_save :reorder_positions
  after_destroy :reorder_after_destroy

  # Padrão Member: Base64 uploader
  mount_base64_uploader :image, ImageUploader

  validates :title, :subtitle, :position, presence: true
  validates :position, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1
  }

  validate :image_size_validation

  scope :active, -> { where(active: true).order(:position) }
  scope :ordered, -> { order(:position) }

  def move_to_position(new_position)
    update(position: new_position)
  end

  def swap_position_with(other_event)
    return if self == other_event
    
    Event.transaction do
      temp_position = position
      update_column(:position, other_event.position)
      other_event.update_column(:position, temp_position)
    end
  end

  private

  def image_size_validation
    # Padrão Member: Verifica presença antes de validar tamanho
    return unless image.present?
    
    if image.size > 5.megabytes
      errors.add(:image, "A imagem deve ter no máximo 5MB")
    end
  end

  # --- Lógica de Posição (Sua lógica original preservada) ---
  def set_default_position
    return if position.present? && position >= 1
    max_position = Event.maximum(:position) || 0
    self.position = max_position + 1
  end

  def reorder_positions
    return unless saved_change_to_position?
    return if position.nil?
    
    max_position = Event.maximum(:position) || 0
    if position > max_position
      update_column(:position, max_position)
      return
    end
    
    old_position = position_before_last_save
    new_position = position
    
    if old_position.nil?
      Event.where("position >= ?", new_position).where.not(id: id).update_all("position = position + 1")
      return
    end
    
    return if old_position == new_position
    
    if new_position > old_position
      Event.where("position > ? AND position <= ?", old_position, new_position).where.not(id: id).update_all("position = position - 1")
    else
      Event.where("position >= ? AND position < ?", new_position, old_position).where.not(id: id).update_all("position = position + 1")
    end
  end

  def reorder_after_destroy
    Event.where("position > ?", position).update_all("position = position - 1")
  end
end