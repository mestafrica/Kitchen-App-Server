class AlterFoodChoicesInMenu < ActiveRecord::Migration[5.0]
  def change
    change_column :menus, :breakfast, 'integer USING CAST(breakfast AS integer)'
    change_column :menus, :lunch, 'integer USING CAST(lunch AS integer)'
    rename_column :menus, :super, :supper
    change_column :menus, :supper, 'integer USING CAST(supper AS integer)'
  end
end
