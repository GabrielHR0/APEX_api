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