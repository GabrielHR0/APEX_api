class Member < ApplicationRecord
  has_many :extension_cores, dependent: :restrict_with_error

  validates :full_name, presence: true
  validate :validate_image
  validates :email, presence: true, uniqueness: true

  has_many :extension_cores
  has_one_attached :image

  before_destroy :ensure_no_extension_cores!

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

  def ensure_no_extension_cores!
    return unless extension_cores.exists?

    errors.add(
      :base,
      'Não é possível remover o membro pois ele possui núcleos de extensão vinculados'
    )
    throw :abort
  end
end
