class Address < ApplicationRecord
    has_paper_trail

    belongs_to :company

    validates :company_id, uniqueness: true
end
