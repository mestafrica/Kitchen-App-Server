class MakeFoodChoicesArray < ActiveRecord::Migration[5.0]
  def change
     change_column :menus, :breakfast_choices, 'integer[] USING ARRAY[breakfast_choices]::INTEGER[]', array: true, null: false, default: []
     change_column :menus, :lunch_choices, 'integer[] USING ARRAY[lunch_choices]::INTEGER[]' ,array: true, null: false, default: []
     change_column :menus, :supper_choices, 'integer[] USING ARRAY[supper_choices]::INTEGER[]', array: true, null: false, default: []
  end
end
