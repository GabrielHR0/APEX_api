class AddDefaultToEventsAndIndexToPosition < ActiveRecord::Migration[7.0]
  def change
    change_column_default :events, :active, true
    add_index :events, :position
  end
end
