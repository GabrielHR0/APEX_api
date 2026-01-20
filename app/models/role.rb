class Role < ApplicationRecord
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
end

# app/models/permission.rb
class Permission < ApplicationRecord
  has_many :role_permissions, dependent: :destroy
  has_many :roles, through: :role_permissions
  
  validates :resource, :action, presence: true
  validates :action, inclusion: { in: %w[create read update destroy manage] }
  
  scope :for_resource, ->(resource) { where(resource: resource) }
  scope :for_action, ->(action) { where(action: action) }
end

# app/models/user_role.rb
class UserRole < ApplicationRecord
  belongs_to :user
  belongs_to :role
end

# app/models/role_permission.rb
class RolePermission < ApplicationRecord
  belongs_to :role
  belongs_to :permission
end