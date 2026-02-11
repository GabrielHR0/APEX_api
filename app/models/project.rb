class Project < ApplicationRecord
    has_paper_trail

    belongs_to :extension_core
    scope :featured, -> { where(featured: true) }

    validates :active, presence: true
    validate :limit_featured_projects, if: :featured?

    private

    def limit_featured_projects
        if Project.featured.where.not(id: id).count >= 1
            errors.add(:featured, 'limite de projetos em destaque atingido')
        end
    end
end
