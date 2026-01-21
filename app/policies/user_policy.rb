class UserPolicy < ApplicationPolicy

  def update?
    user.admin? || user.id == record.id
  end

  def destroy?
    user.admin? && user.id != record.id
  end

  def permitted_attributes
    user.admin? ? [:email, :password, :role] : [:email, :password]
  end

end
