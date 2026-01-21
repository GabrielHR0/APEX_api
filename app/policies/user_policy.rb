class UserPolicy < ApplicationPolicy
  def update?
    super || user.id == record.id
  end

  def destroy?
    super && user.id != record.id
  end

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(id: user.id)
      end
    end
  end
end



