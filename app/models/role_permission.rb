class RolePermission < ApplicationRecord
  has_paper_trail
  after_commit :clear_users_cache

  
  belongs_to :role
  belongs_to :permission

  private
  
  def clear_users_cache
    role.users.find_each do |user|
      Rails.cache.delete("user_permissions/#{user.id}")
    end
  end

end