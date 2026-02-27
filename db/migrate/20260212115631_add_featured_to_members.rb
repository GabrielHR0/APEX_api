class AddFeaturedToMembers < ActiveRecord::Migration[8.1]
  def change
    add_column :members, :featured, :boolean, default: false
  end
end
