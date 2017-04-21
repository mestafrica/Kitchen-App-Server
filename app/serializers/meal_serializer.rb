class MealSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :picture_path

  belongs_to :breakfast_option
  belongs_to :lunch_option
  belongs_to :breakfast_option
end
