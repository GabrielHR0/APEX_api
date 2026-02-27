class RemoveImageFromHeroCards < ActiveRecord::Migration[8.1]
  def change
    remove_column :hero_cards, :image, :string
  end
end
