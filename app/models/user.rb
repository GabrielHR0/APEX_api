class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: self

  # ASSOCIAÇÕES RBAC
  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles
  has_many :permissions, through: :roles
  
  before_create :set_jti
  after_create :assign_default_role, if: :new_record?
  
  # JWT payload personalizado
  def jwt_payload
    super.merge(
      roles: roles.pluck(:name),
      #permissions: permission_list
    )
  end
  
  # MÉTODOS DE ROLE
  def add_role(role_name)
    role = Role.find_by(name: role_name)
    if role && !has_role?(role_name)
      roles << role
      true
    else
      false
    end
  end
  
  def remove_role(role_name)
    role = Role.find_by(name: role_name)
    if role
      roles.delete(role)
      true
    else
      false
    end
  end
  
  def has_role?(role_name)
    roles.exists?(name: role_name)
  end
  
  def admin?
    has_role?(Role::ADMIN)
  end
  
  def editor?
    has_role?(Role::EDITOR)
  end
  
  def viewer?
    has_role?(Role::VIEWER)
  end
  
  def can?(resource, action)    
    Rails.logger.info "[AUTH] Verificando permissão -> resource=#{resource}, action=#{action}"
    permissions.exists?(resource: resource.to_s, action: action.to_s)
  end
  
  def cannot?(resource, action)
    !can?(resource, action)
  end
  
  def permission_list
    permissions.pluck(:resource, :action).map { |r, a| "#{r}:#{a}" }
  end
  
  private
  
  def set_jti
    self.jti ||= SecureRandom.uuid
  end
  
  def assign_default_role
    add_role(Role::VIEWER) if roles.empty?
  end
end