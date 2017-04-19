class AlterFoodChoicesInMenu < ActiveRecord::Migration[5.0]
  def change
    change_column :menus, :breakfast_choices, 'integer USING CAST(breakfast_choices AS integer)'
    change_column :menus, :lunch_choices, 'integer USING CAST(lunch_choices AS integer)'
    change_column :menus, :supper_choices, 'integer USING CAST(supper_choices AS integer)'
  end
end
