class CreateHeroCards < ActiveRecord::Migration[8.1]
  def change
    create_table :hero_cards, id: :uuid do |t|
      t.string :title
      t.string :description
      t.integer :position
      t.boolean :active

      t.timestamps
    end
  end
end
