class Order < ApplicationRecord

    belongs_to :user

    belongs_to :breakfast, class_name: :Meal

    belongs_to :lunch, 	   class_name: :Meal

    belongs_to :supper,    class_name: :Meal

    belongs_to :menu


end
