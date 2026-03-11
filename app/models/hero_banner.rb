class HeroBanner < ApplicationRecord
  has_paper_trail
  
  # Padronização: Base64 uploader
  mount_base64_uploader :image, ImageUploader

  validates :title, :description, presence: true
  validate :image_size_validation
    # Removido: validação que impede desativar o último ativo

  scope :active, -> { where(active: true) }

  private

  def image_size_validation
    return unless image.present?
    
    if image.size > 5.megabytes
      errors.add(:image, "A imagem deve ter no máximo 5MB")
    end
  end

    # Removido: método que impede desativar o último ativo
end