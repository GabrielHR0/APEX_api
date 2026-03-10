class Project < ApplicationRecord
    has_paper_trail

    belongs_to :extension_core
    scope :featured, -> { where(featured: true) }

    validates :active, inclusion: { in: [true, false] }
    validate :limit_featured_projects, if: -> { featured? && featured_changed? }

    private

    def limit_featured_projects
        scope = Project.where(featured: true, active: true, extension_core_id: extension_core_id)
        scope = scope.where.not(id: id) if persisted?
        if scope.exists?
            errors.add(:featured, 'limite de projetos em destaque atingido')
        end
    end
end
