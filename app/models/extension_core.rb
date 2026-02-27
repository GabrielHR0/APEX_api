class ExtensionCore < ApplicationRecord
  has_paper_trail

  mount_base64_uploader :icon, ImageUploader
  

  mount_uploaders :images, ImageUploader

  belongs_to :member
  has_many :projects, dependent: :destroy

  validates :acronym, :name, presence: true
  validate :image_size_validation
  validate :image_count_within_limit

  scope :ordered, -> { order(created_at: :desc) }

  def image_urls
    images.map(&:url).compact
  end

  def icon_url
    icon.url if icon.present?
  end

  private

  def image_size_validation
    # Validação do Ícone (Igual ao Event)
    if icon.present? && icon.size > 5.megabytes
      errors.add(:icon, "O ícone deve ter no máximo 5MB")
    end

    # Validação das Imagens do Array
    images.each do |img|
      if img.size > 5.megabytes
        errors.add(:images, "Cada imagem deve ter no máximo 5MB")
      end
    end
  end

  def image_count_within_limit
    # Verifica se o array de imagens excede o limite
    if images.count > 2
      errors.add(:images, "não pode ter mais de 2 imagens")
    end
  end
end