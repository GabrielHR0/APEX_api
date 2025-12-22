class Company < ApplicationRecord
    has_paper_trail

    validate :singleton_verification, on: :create

    validates :phone, phone: true
    validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}
    validates :logo, content_type: ['image/png', 'image/jpeg'],
                size: {less_than: 5.megabytes},
                if: -> { logo.attached? }

    def strip_whitespace
        self.email = email.strip if email.present?
        self.name  = name.strip if name.present?
        self.phone = phone.strip if phone.present?
    end

    has_one_attached :logo
    has_one :address, as: :enderecavel, dependent: :destroy
    has_many :social_media_profile, dependent: :destroy

    accepts_nested_attributes_for :address, update_only: true
    accepts_nested_attributes_for :social_media_profile, allow_destroy: true

    private

    def singleton_verification
        if Company.exists?
            errors.add(:base, "Só pode haver um registro de company")
        end
    end
end
