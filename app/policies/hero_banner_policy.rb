class HeroBannerPolicy < ApplicationPolicy
  def active?
    check_permission(:read)
  end
end