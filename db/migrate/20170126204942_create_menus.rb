class CreateMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :menus do |t|
      t.date   :day_created
      t.string :breakfast_choices
      t.string :lunch_choices
      t.string :supper_choices
      t.timestamps
    end
  end
end
