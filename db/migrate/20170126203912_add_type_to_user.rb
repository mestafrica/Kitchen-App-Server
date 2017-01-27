class AddTypeToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :type, :integer, null: false, default: 0
  end

  def down
    remove_column :users, :type
  end
end
