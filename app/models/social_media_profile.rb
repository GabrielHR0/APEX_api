class SocialMediaProfile < ApplicationRecord
    has_paper_trail

    before_validation :set_default_position, on: :create
    after_save :reorder_positions
    after_destroy :reorder_after_destroy
    before_save :generate_full_url

    belongs_to :company

    validates :position, numericality: { 
        only_integer: true,
        greater_than_or_equal_to: 1,
    }, allow_nil: true

    scope :active, -> { where(active: true).order(:position) }
  
  def move_to_position(new_position)
    update(position: new_position)
  end
  
  def swap_position_with(other_profile)
    return if self == other_profile
    
    SocialMediaProfile.transaction do
      temp_position = position
      update_column(:position, other_profile.position)
      other_profile.update_column(:position, temp_position)
    end
  end
  
  private
  
  def set_default_position
    return if position.present? && position >= 1
    
    max_position = SocialMediaProfile.maximum(:position) || 0
    self.position = max_position + 1
  end
  
  def reorder_positions
    return unless saved_change_to_position?
    return if position.nil?
    
    max_position = SocialMediaProfile.maximum(:position) || 0
    if position > max_position
      update_column(:position, max_position)
      return
    end
    
    old_position = position_before_last_save
    new_position = position
    
    if old_position.nil?
      SocialMediaProfile.where("position >= ?", new_position)
                   .where.not(id: id)
                   .update_all("position = position + 1")
      return
    end
    
    return if old_position == new_position
    
    if new_position > old_position
      SocialMediaProfile.where("position > ? AND position <= ?", old_position, new_position)
                   .where.not(id: id)
                   .update_all("position = position - 1")
    else
      # Movendo para cima
      SocialMediaProfile.where("position >= ? AND position < ?", new_position, old_position)
                   .where.not(id: id)
                   .update_all("position = position + 1")
    end
  end
  
  def reorder_after_destroy
    position_to_fill = position
    
    SocialMediaProfile.where("position > ?", position_to_fill)
                 .update_all("position = position - 1")
  end

    def generate_full_url
        url_base = "https://www."
        if !self.url.present?
            self.url = "#{url_base}#{self.platform}.com/#{self.username}"
        end
    end
end
