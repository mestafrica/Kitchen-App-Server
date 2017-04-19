class User < ApplicationRecord

  enum nationality: [:kenya, :south_africa, :ghana, :nigeria, :ivory_coast]

  enum sex: [:male, :female, :other]

  enum user_type: [:kitchen_staff, :eit, :fellow, :minc]

  has_one :order

  validates :first_name,
            :last_name,
            :email,
            :sex,
            :nationality,
            :user_type,
            presence: true
end
