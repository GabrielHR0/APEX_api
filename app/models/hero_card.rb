class HeroCard < ApplicationRecord
    has_paper_trail
    
    before_validation :set_default_position, on: :create
    after_save :reorder_positions
    after_destroy :reorder_after_destroy

    validates :title, :description, :position, presence: true
    validates :position, numericality: {
        only_integer: true,
        greater_than_or_equal_to: 1,
    }

    has_one_attached :image
    validate :validate_image

    scope :active, -> { where(active: true).order(:position) }
    scope :ordered, -> { order(:position) }

  def move_to_position(new_position)
    update(position: new_position)
  end
  
  def swap_position_with(other_card)
    return if self == other_card
    
    HeroCard.transaction do
      temp_position = position
      update_column(:position, other_card.position)
      other_card.update_column(:position, temp_position)
    end
  end
  
  private
  
    def set_default_position
        return if position.present? && position >= 1
        
        max_position = HeroCard.maximum(:position) || 0
        self.position = max_position + 1
    end
    
    def reorder_positions
        return unless saved_change_to_position?
        return if position.nil?
        
        max_position = HeroCard.maximum(:position) || 0
        if position > max_position
        update_column(:position, max_position)
        return
        end
        
        old_position = position_before_last_save
        new_position = position
        
        if old_position.nil?
        HeroCard.where("position >= ?", new_position)
                    .where.not(id: id)
                    .update_all("position = position + 1")
        return
        end
        
        return if old_position == new_position
        
        if new_position > old_position
        HeroCard.where("position > ? AND position <= ?", old_position, new_position)
                    .where.not(id: id)
                    .update_all("position = position - 1")
        else
        HeroCard.where("position >= ? AND position < ?", new_position, old_position)
                    .where.not(id: id)
                    .update_all("position = position + 1")
        end
    end
    
    def reorder_after_destroy
        position_to_fill = position
        
        HeroCard.where("position > ?", position_to_fill)
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

    def reorder_after_destroy
        position_to_fill = position
        
        HeroCard.where("position > ?", position_to_fill)
                    .update_all("position = position - 1")
    end
end
