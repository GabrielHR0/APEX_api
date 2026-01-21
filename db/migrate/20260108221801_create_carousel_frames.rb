class CreateCarouselFrames < ActiveRecord::Migration[8.1]
  def change
    create_table :carousel_frames do |t|
      t.string :title
      t.text :description
      t.integer :position
      t.boolean :active, default: true

      t.timestamps
    end

    add_index :carousel_frames, :position
    add_index :carousel_frames, :active
  end
end
