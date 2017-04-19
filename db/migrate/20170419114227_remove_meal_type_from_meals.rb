class RemoveMealTypeFromMeals < ActiveRecord::Migration[5.0]
  def change
    remove_column :meals, :meal_type, :boolean
  end
end
