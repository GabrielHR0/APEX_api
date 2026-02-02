class HeroBanner < ApplicationRecord

  validates :title, :description, presence: true
  validate :validate_image
  validate :only_one_active, if: :active?

  scope :active, -> { where(active: true)}
  
  has_one_attached :image

  private

  def validate_image
    return unless image.attached?

    allowed_types = ['image/png', 'image/jpeg', 'image/gif', 'image/webp']

    unless allowed_types.include?(image.content_type)
      errors.add(:image, 'A imagem deve ser um arquivo JPG, PNG, JPEG OU WEBP')
    end

    max_size = 5.megabytes
    if image.byte_size > max_size
      errors.add(:image, 'A imagem deve ter no máximo 5MG')
    end
  end

  def image_url
    return nil unless image.attached?

    Rails.application.routes.url_helpers.rails_blob_url(
    image,
    only_path: false
    )
  end

  def only_one_active
    if HeroBanner.where(active: true).where.not(id: id).exists?
      errors.add(:active, 'já existe um Hero Banner ativo')
    end
  end
end
