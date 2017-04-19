class RenameKindFromUsersToUserType < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :kind, :user_type
  end
end
