class CreateSocialMediaProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :social_media_profiles do |t|
      t.string :platform
      t.string :url
      t.string :username
      t.boolean :active

      t.belongs_to :company, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
