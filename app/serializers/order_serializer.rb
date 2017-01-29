class OrderSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :meal_id, :menu_id
end
