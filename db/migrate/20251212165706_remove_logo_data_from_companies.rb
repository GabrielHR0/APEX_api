class RemoveLogoDataFromCompanies < ActiveRecord::Migration[8.0]
  def change
    remove_column :companies, :logo_data, :text
  end
end
