class RenameDayCreatedFromMenusToMenuDate < ActiveRecord::Migration[5.0]
  def change
    rename_column :menus, :day_created, :menu_date
  end
end
