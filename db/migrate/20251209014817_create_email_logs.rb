class CreateEmailLogs < ActiveRecord::Migration[8.0]
  def change
    create_table :email_logs do |t|
      t.references :contact, null: false, foreign_key: true
      t.string :status
      t.string :external_id
      t.text :error_message

      t.timestamps
    end
  end
end
