class OrderSerializer < ActiveModel::Serializer
  attribute :id

  has_many :user
  attribute :serving_date

  has_many :breakfast
  has_many :lunch
  has_many :supper
end
