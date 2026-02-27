class AuditPolicy < ApplicationPolicy
  def index?
    check_permission(:read)
  end

  def show?
    check_permission(:read)
  end
end