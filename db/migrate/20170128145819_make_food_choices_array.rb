class MakeFoodChoicesArray < ActiveRecord::Migration[5.0]
  def change
     change_column :menus, :breakfast, 'integer[] USING ARRAY[breakfast]::INTEGER[]', array: true, null: false, default: []
     change_column :menus, :lunch, 'integer[] USING ARRAY[lunch]::INTEGER[]' ,array: true, null: false, default: []
     change_column :menus, :supper, 'integer[] USING ARRAY[supper]::INTEGER[]', array: true, null: false, default: []
  end
end
