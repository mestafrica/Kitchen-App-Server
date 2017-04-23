class MenuSerializer < ActiveModel::Serializer
  attribute :serving_date
  has_many :breakfast_options
  has_many :lunch_options
  has_many :supper_options
end
