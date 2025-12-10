class AddExtensionCoreToProjects < ActiveRecord::Migration[8.0]
  def change
    add_reference :projects, :extension_core, null: false, foreign_key: true
  end
end
