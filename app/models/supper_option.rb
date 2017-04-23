class SupperOption < ApplicationRecord
  belongs_to :meal
  validates :serving_date, :meal, presence: true

  def self.create_all_by_serving_date!(serving_date, supper_choices)
    return if supper_choices.nil?

    supper_choices.each do |supper_choice|
      create!(serving_date: serving_date, meal_id: supper_choice)
    end
  end
end
