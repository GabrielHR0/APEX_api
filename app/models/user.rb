class User < ApplicationRecord
  has_paper_trail
  include Devise::JWT::RevocationStrategies::JTIMatcher
  attr_accessor :admin_password_confirmation
  
  require 'set'

  devise :database_authenticatable,
         :recoverable,
         :rememberable,
         :validatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: self

  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles
  has_many :permissions, -> { distinct }, through: :roles

  before_create :set_jti
  after_create :assign_default_role

  after_commit :clear_permission_cache

  # Payload JWT com todas as informações necessárias
  # Isso não é usado no front por motivos de não vou mexer no que já funciona
  def jwt_payload
    super.merge(
      id: id,
      email: email,
      roles: role_names.to_a,
      permissions: permission_set.to_a,
      jti: jti
    )
  end

  # Cache de permissões com objetos completos
  def permission_objects_cache
    Rails.cache.fetch("user_permission_objects/#{id}", expires_in: 12.hours) do
      permissions.select(:id, :resource, :action, :description, :created_at, :updated_at).to_a
    end
  end

  # Cache de permissões como strings para verificação rápida
  def permission_cache
    Rails.cache.fetch("user_permissions_strings/#{id}", expires_in: 12.hours) do
      permissions
        .pluck(:resource, :action)
        .map { |r, a| "#{r}:#{a}" }
        .to_set
        .freeze
    end
  end

  # Retorna o conjunto completo de permissões como strings
  def permission_set
    permission_cache
  end

  # Retorna objetos completos de permissões
  def permission_objects
    permission_objects_cache
  end

  def role_names
    Rails.cache.fetch("user_roles/#{id}", expires_in: 12.hours) do
      roles.pluck(:name).to_set.freeze
    end
  end

  # Retorna objetos completos de roles com suas permissions
  def role_objects
    Rails.cache.fetch("user_role_objects/#{id}", expires_in: 12.hours) do
      roles.includes(:permissions).to_a
    end
  end

  def role_ids
    Rails.cache.fetch("user_role_ids/#{id}", expires_in: 12.hours) do
      roles.pluck(:id)
    end
  end

  def clear_permission_cache
    Rails.cache.delete_multi([
      "user_permission_objects/#{id}",
      "user_permissions_strings/#{id}",
      "user_roles/#{id}",
      "user_role_objects/#{id}",
      "user_role_ids/#{id}"
    ])

    @permission_objects_cache = nil
    @permission_cache = nil
    @role_names = nil
    @role_objects = nil
  end

  def can?(resource, action)
    permission_cache.include?("#{resource}:#{action}")
  end

  def cannot?(resource, action)
    !can?(resource, action)
  end

  def has_role?(role_name)
    role_names.include?(role_name)
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

  def add_role(role_name)
    role = Role.find_by(name: role_name)
    return false unless role
    return false if has_role?(role_name)

    roles << role
    clear_permission_cache
    true
  end

  def remove_role(role_name)
    role = Role.find_by(name: role_name)
    return false unless role

    roles.delete(role)
    clear_permission_cache
    true
  end

  # JTI Rotation: Gera novo JTI
  def rotate_jti!
    update!(jti: SecureRandom.uuid)
    clear_permission_cache
    jti
  end

  private

  def set_jti
    self.jti ||= SecureRandom.uuid
  end

  def assign_default_role
    return unless roles.empty?

    default_role = Role.find_by(name: Role::VIEWER)
    roles << default_role if default_role
  end
end