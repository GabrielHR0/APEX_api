class AddColumnActiveToEvents < ActiveRecord::Migration[8.1]
  def change
      add_column :events, :active, :boolean, null: false
  end
end
