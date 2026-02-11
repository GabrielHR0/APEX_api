class RenameSendAtToSentAtInContacts < ActiveRecord::Migration[8.1]
  def change
    rename_column :contacts, :send_at, :sent_at
  end
end
