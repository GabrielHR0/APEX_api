class AddCarrierWaveFields < ActiveRecord::Migration[8.1]
  def change
    add_column :hero_banners, :image, :string
    add_column :hero_cards, :image, :string
    add_column :cards, :image, :string
    add_column :carousel_frames, :image, :string
    add_column :events, :image, :string
    add_column :members, :image, :string
    
    add_column :extension_cores, :images, :json
    add_column :extension_cores, :icon, :string
  end
end
