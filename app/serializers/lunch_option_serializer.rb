class LunchOptionSerializer < ActiveModel::Serializer
  attributes :id, :serving_date
  has_one :meal

  belongs_to :menu
end
