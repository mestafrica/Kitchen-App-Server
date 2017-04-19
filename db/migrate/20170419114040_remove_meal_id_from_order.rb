class RemoveMealIdFromOrder < ActiveRecord::Migration[5.0]
  def change
  	remove_index   :orders, :meal_id
  	remove_column  :orders,  :meal_id
  end
end
