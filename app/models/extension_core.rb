class ExtensionCore < ApplicationRecord
  has_paper_trail

  validates :acronym, :name, presence: true

  belongs_to :member
  has_many :projects, dependent: :destroy
  
  has_many_attached :images
  has_one_attached :icon

  validate :image_count_within_limit

  def image_count_within_limit
    if images.count > 2
      errors.add(:images, "não pode ter mais de 2 imagens")
    end
  end

  def image_urls
    images.map do |image|
      {
        id: image.id,
        url: Rails.application.routes.url_helpers.url_for(image),
        filename: image.filename.to_s,
        content_type: image.content_type,
        byte_size: image.byte_size
      }
    end
  end

  def icon_url
    if icon.attached?
      Rails.application.routes.url_helpers.url_for(icon)
    end
  end
end