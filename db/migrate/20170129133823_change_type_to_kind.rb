class ChangeTypeToKind < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :type
    add_column :users, :kind, :integer, null: false, default: 0
  end
end
