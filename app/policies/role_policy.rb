class RolePolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def create?
    user.admin?
  end

  def update?
    user.admin? && record.name != Role::ADMIN
  end

  def destroy?
    user.admin? && record.name != Role::ADMIN
  end
end
