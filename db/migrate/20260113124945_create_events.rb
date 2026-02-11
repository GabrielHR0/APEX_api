class CreateEvents < ActiveRecord::Migration[8.1]
  def change
    create_table :events, id: :uuid do |t|
      t.string :title
      t.string :subtitle
      t.integer :position

      t.timestamps
    end
  end
end
