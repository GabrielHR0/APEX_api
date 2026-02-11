class Address < ApplicationRecord
    has_paper_trail

    belongs_to :enderecavel, polymorphic: true
end
