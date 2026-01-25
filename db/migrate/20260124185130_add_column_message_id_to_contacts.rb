class AddColumnMessageIdToContacts < ActiveRecord::Migration[8.1]
  def change
    add_column :contacts, :message_id, :string
  end
end
