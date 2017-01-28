class MenuSerializer < ActiveModel::Serializer
  attributes :id, :day_created, :breakfast, :lunch, :supper
end
