class CreateHeroBanners < ActiveRecord::Migration[8.1]
  def change
    create_table :hero_banners do |t|
      t.string :title
      t.text :description
      t.boolean :active, default: true, null: false

      t.timestamps
    end
    add_index :hero_banners, :active, where: "active = true"
  end
end
