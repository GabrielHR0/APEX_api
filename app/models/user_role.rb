class UserRole < ApplicationRecord
  has_paper_trail
  after_commit :clear_user_permissions_cache

  belongs_to :user
  belongs_to :role

  private
  
  def clear_user_permissions_cache
    Rails.cache.delete("user_permissions/#{user_id}")
  end

end