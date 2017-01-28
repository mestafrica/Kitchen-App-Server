class Order < ApplicationRecord

    belongs_to :user

    belongs_to :meal

    belongs_to :menu


end
