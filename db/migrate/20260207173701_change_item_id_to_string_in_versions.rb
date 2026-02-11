class ChangeItemIdToStringInVersions < ActiveRecord::Migration[8.1]
  def change
      change_column :versions, :item_id, :string
  end
end
