class BreakfastOption < ApplicationRecord
  belongs_to :meal
  validates :serving_date, :meal, presence: true

  def self.create_all_by_serving_date!(serving_date, breakfast_choices)
    return if breakfast_choices.nil?

    breakfast_choices.each do |breakfast_choice|
      create!(serving_date: serving_date, meal_id: breakfast_choice)
    end
  end
end
