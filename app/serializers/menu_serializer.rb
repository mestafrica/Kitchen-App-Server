class MenuSerializer < ActiveModel::Serializer
  attribute :serving_date
  has_many :breakfast_options
  has_many :lunch_options
  has_many :supper_options


  class BreakfastOptionSerializer < ActiveModel::Serializer
    attributes :serving_date
    has_one :meal
  end

  class LunchOptionSerializer < ActiveModel::Serializer
    attributes :serving_date
    has_one :meal
  end

  class SupperOptionSerializer < ActiveModel::Serializer
    attributes :serving_date
    has_one :meal
  end
end
