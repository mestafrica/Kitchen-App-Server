class MealSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :picture_path, :meal_type
end
