class MemberPolicy < ApplicationPolicy
  def count?
    check_permission(:read)    
  end
end