class CreateMembers < ActiveRecord::Migration[8.1]
  def change
    create_table :members, id: :uuid do |t|
      t.string :fullName
      t.string :role
      t.string :email
      t.string :phone
      t.boolean :active, default: true, null: false

      t.timestamps
    end
  end
end
