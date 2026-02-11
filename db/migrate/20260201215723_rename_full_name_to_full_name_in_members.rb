class RenameFullNameToFullNameInMembers < ActiveRecord::Migration[8.1]
  def change
    rename_column :members, :fullName, :full_name
  end
end
