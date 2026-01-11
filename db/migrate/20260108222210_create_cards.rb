class CreateCards < ActiveRecord::Migration[8.1]
  def change
    create_table :cards do |t|
      t.string :title
      t.text :description
      t.integer :position
      t.references :carousel_frame, null: false, foreign_key: true
      t.boolean :active, default: true

      t.timestamps
    end
    add_index :cards, :position
  end
end
