class Role < ApplicationRecord
  has_paper_trail
  
  ADMIN = 'admin'.freeze
  CRITICAL_RESOURCES = ['user', 'role', 'permission'].freeze

  validate :ensure_admin_retains_critical_permissions, if: -> { name == ADMIN }

  before_destroy :check_if_admin, prepend: true
  before_update :check_if_admin
  
  has_many :user_roles, dependent: :destroy
  has_many :users, through: :user_roles
  has_many :role_permissions, dependent: :destroy
  has_many :permissions, through: :role_permissions
  
  validates :name, presence: true, uniqueness: true
  
  # Constantes para roles padrão
  ADMIN = 'admin'
  EDITOR = 'editor'
  VIEWER = 'viewer'
  
  def self.admin  
    find_by(name: ADMIN)
  end
  
  def self.editor
    find_by(name: EDITOR)
  end
  
  def self.viewer
    find_by(name: VIEWER)
  end

  private 

  def check_if_admin
    if name_was == ADMIN || name == ADMIN
      errors.add(:base, "O cargo Administrador é vital para o sistema e não pode ser alterado ou removido.")
      throw(:abort)
    end
  end

  def ensure_admin_retains_critical_permissions
    if permission_ids_changed?
      assigned_permissions = Permission.where(id: permission_ids)
      
      CRITICAL_RESOURCES.each do |resource|
        has_manage = assigned_permissions.any? { |p| p.resource == resource && p.action == 'manage' }
        has_basic = assigned_permissions.any? { |p| p.resource == resource && ['create', 'update', 'read'].include?(p.action) }

        unless has_manage || has_basic
          errors.add(:permissions, "O Administrador não pode perder acesso de criação/edição sobre: #{resource}")
        end
      end
    end
  end
  
end