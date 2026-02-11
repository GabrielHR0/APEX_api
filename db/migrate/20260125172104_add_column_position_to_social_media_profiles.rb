class AddColumnPositionToSocialMediaProfiles < ActiveRecord::Migration[8.1]
  def change
    add_column :social_media_profiles, :position, :integer
    add_index :social_media_profiles, :position
    add_index :social_media_profiles, :active
  end
end
