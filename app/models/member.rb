class Member < ApplicationRecord
  has_paper_trail
  mount_base64_uploader :image, ImageUploader

  has_many :extension_cores, dependent: :restrict_with_error

  validates :full_name, presence: true
  validates :email, presence: true, uniqueness: true

  validate :image_size_validation
  validate :limit_featured_members, if: :featured?

  scope :active, -> { where(active: true) }
  scope :featured, -> { where(featured: true) }

  before_destroy :ensure_no_extension_cores!

  private

  def image_size_validation
    if image.size > 5.megabytes
      errors.add(:image, "A imagem deve ter no máximo 5MB")
    end
  end

  def ensure_no_extension_cores!
    if extension_cores.exists?
      errors.add(:base, 'Não é possível remover o membro pois ele possui núcleos de extensão vinculados')
      throw :abort
    end
  end

  def limit_featured_members
    featured_count = Member.where(featured: true).where.not(id: id).count
    if featured_count >= 2
      errors.add(:featured, 'Não é possível ter mais de 2 membros destacados simultaneamente.')
    end
  end
end