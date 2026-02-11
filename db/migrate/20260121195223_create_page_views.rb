class CreatePageViews < ActiveRecord::Migration[8.0]
  def change
    create_table :page_views, id: :uuid do |t|
      t.string :page
      t.string :ip
      t.string :user_agent

      t.timestamps
    end
  end
end
