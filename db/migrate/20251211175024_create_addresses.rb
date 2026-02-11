class CreateAddresses < ActiveRecord::Migration[8.0]
  def change
    create_table :addresses, id: :uuid do |t|
      t.string :street
      t.string :number
      t.string :complement
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :country

      t.references :enderecavel, polymorphic: true, null: false

      t.timestamps
    end
  end
end
