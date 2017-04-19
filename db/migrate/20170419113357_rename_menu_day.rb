class RenameMenuDay < ActiveRecord::Migration[5.0]
  def change
  	rename_column :menus, :day_created, :menu_day
  end
end
