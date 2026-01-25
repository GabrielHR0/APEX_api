class PageViewPolicy < ApplicationPolicy
  def create?
    true
  end

  def index?
    check_permission(:read)
  end

  def stats?
    check_permission(:read)
  end

  def monthly?
    check_permission(:read)
  end

  def by_page?
    check_permission(:read)
  end
end
