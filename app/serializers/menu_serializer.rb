class MenuSerializer < ActiveModel::Serializer
  attribute :date
  has_many :breakfast_options
  has_many :lunch_options
  has_many :supper_options
end
