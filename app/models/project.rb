class Project < ApplicationRecord
    has_paper_trail

    belongs_to :extension_core
    scope :featured, -> { where(featured: true) }

    validates :active, presence: true
    validate :limit_featured_projects, if: :featured?

    private

    def limit_featured_projects
        scope = Project.featured
        scope = scope.where.not(id: id) if persisted?
        if scope.count >= 1
            errors.add(:featured, 'limite de projetos em destaque atingido')
        end
    end
end
