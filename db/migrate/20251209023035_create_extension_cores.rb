class CreateExtensionCores < ActiveRecord::Migration[8.0]
  def change
    create_table :extension_cores, id: :uuid do |t|
      t.string :acronym
      t.string :name
      t.string :description
      t.string :director_name
      t.string :director_email

      t.timestamps
    end
  end
end
