class RefactorAddressesToCompanyReference < ActiveRecord::Migration[8.1]
  def up
    add_reference :addresses, :company, type: :uuid, foreign_key: true, null: true, index: false

    first_company_id = select_value("SELECT id FROM companies ORDER BY created_at ASC LIMIT 1")
    if first_company_id.present?
      execute <<~SQL
        UPDATE addresses
        SET company_id = '#{first_company_id}'
        WHERE company_id IS NULL
      SQL
    end

    execute <<~SQL
      DELETE FROM addresses
      WHERE id IN (
        SELECT id
        FROM (
          SELECT
            id,
            ROW_NUMBER() OVER (
              PARTITION BY company_id
              ORDER BY created_at DESC NULLS LAST, updated_at DESC NULLS LAST
            ) AS row_num
          FROM addresses
          WHERE company_id IS NOT NULL
        ) duplicated
        WHERE duplicated.row_num > 1
      )
    SQL

    remove_index :addresses, name: "index_addresses_on_enderecavel", if_exists: true
    remove_column :addresses, :enderecavel_type, :string
    remove_column :addresses, :enderecavel_id, :bigint

    change_column_null :addresses, :company_id, false
    remove_index :addresses, :company_id, if_exists: true
    add_index :addresses, :company_id, unique: true
  end

  def down
    add_column :addresses, :enderecavel_type, :string
    add_column :addresses, :enderecavel_id, :uuid

    execute <<~SQL
      UPDATE addresses
      SET enderecavel_type = 'Company', enderecavel_id = company_id
      WHERE company_id IS NOT NULL
    SQL

    add_index :addresses, [:enderecavel_type, :enderecavel_id], name: "index_addresses_on_enderecavel"

    remove_index :addresses, :company_id, if_exists: true
    remove_reference :addresses, :company, foreign_key: true
  end
end
