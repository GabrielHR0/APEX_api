class Address < ApplicationRecord

    belongs_to :enderecavel, polymorphic: true
end
