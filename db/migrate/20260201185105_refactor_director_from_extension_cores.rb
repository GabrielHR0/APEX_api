class RefactorDirectorFromExtensionCores < ActiveRecord::Migration[8.1]
  def change
    remove_column :extension_cores, :director_name, :string
    remove_column :extension_cores, :director_email, :string

    add_reference :extension_cores, :member, null: false, foreign_key: true, type: :uuid
  end
end
