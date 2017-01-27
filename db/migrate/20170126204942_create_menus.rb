class CreateMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :menus do |t|
      t.date   :day_created
      t.string :breakfast
      t.string :lunch
      t.string :super
      t.timestamps
    end
  end
end
