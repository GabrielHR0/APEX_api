class Project < ApplicationRecord
    has_paper_trail

    validates :active, presence: true
end
