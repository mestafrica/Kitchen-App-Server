class BreakfastOptionSerializer < ActiveModel::Serializer
  attributes :id, :serving_date
  has_one :meal
end
