class CreateContacts < ActiveRecord::Migration[8.0]
  def change
    create_table :contacts, id: :uuid do |t|
      t.string :name
      t.string :email
      t.text :message
      t.string :status
      t.string :ip_address
      t.datetime :send_at

      t.timestamps
    end
  end
end
