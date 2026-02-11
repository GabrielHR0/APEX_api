class PageViewPolicy < ApplicationPolicy
  def create?
    true 
  end

  def summary?
    check_permission(:read)
  end

  def chart_data?
    check_permission(:read)
  end

  def top_pages?
    check_permission(:read)
  end

  def top_sources?
    check_permission(:read)
  end
end