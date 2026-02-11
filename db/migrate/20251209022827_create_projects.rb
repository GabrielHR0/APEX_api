class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects, id: :uuid do |t|
      t.string :name
      t.string :description
      t.string :details

      t.timestamps
    end
  end
end
