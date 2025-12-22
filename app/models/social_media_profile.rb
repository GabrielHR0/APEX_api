class SocialMediaProfile < ApplicationRecord
    has_paper_trail
    before_save :generate_full_url

    belongs_to :company

    private

    def generate_full_url
        url_base = "https://www."
        if !self.url.present?
            self.url = "#{url_base}#{self.platform}.com/#{self.username}"
        end
    end
end
