class AddObjectChangesToVersions < ActiveRecord::Migration[8.1]
  def change
    add_column :versions, :object_changes, :jsonb unless column_exists?(:versions, :object_changes)
  end
end
