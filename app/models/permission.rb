class Permission < ApplicationRecord
  has_many :role_permissions, dependent: :destroy
  has_many :roles, through: :role_permissions
  
  validates :resource, :action, presence: true
  validates :action, inclusion: { in: %w[create read update destroy manage] }
  
  scope :for_resource, ->(resource) { where(resource: resource) }
  scope :for_action, ->(action) { where(action: action) }
end