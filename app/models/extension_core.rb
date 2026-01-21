class ExtensionCore < ApplicationRecord
    has_paper_trail

    validates :acronym, :name, presence: true
    has_many_attached :images

    def image_count_within_limit
        if images.count > 2
            errors.add(:images, "não pode ter mais de 2 imagens")
        end
    end
end
