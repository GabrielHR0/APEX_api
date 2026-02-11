class CachePolicy < ApplicationPolicy
    def clear?
      check_permission(:manage, resource: 'cache')
    end
end