class ContactPolicy < ApplicationPolicy
  def index?
    check_permission(:read)
  end

  def show?
    check_permission(:read)
  end

  def create?
    true
  end

  def update?
    check_permission(:update)
  end

  def destroy?
    check_permission(:destroy)
  end

  def summary?
    check_permission(:read)
  end

  def chart_data?
    check_permission(:read)
  end

  def by_status?
    check_permission(:read)
  end
end