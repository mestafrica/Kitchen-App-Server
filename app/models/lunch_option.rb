class LunchOption < ApplicationRecord
  belongs_to :meal
  validates :serving_date, :meal, presence: true

  def self.create_all_by_serving_date!(serving_date, lunch_choices)
    return if lunch_choices.nil?

    lunch_choices.each do |lunch_choice|
      create!(serving_date: serving_date, meal_id: lunch_choice)
    end
  end
end
