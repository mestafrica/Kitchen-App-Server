# The Menu model is a convenient class for creating breakfast_options,
# lunch_options and supper_options for a particular day
class Menu < ActiveModelSerializers::Model
  include ActiveModel::Model

  attr_accessor :serving_date
  attr_accessor :breakfast_choices
  attr_accessor :lunch_choices
  attr_accessor :supper_choices

  validates :serving_date, presence: true

  def breakfast_options
    BreakfastOption.where(serving_date: serving_date)
  end

  def lunch_options
    LunchOption.where(serving_date: serving_date)
  end

  def supper_options
    SupperOption.where(serving_date: serving_date)
  end

  def self.find(serving_date)
    Menu.new(serving_date: serving_date)
  end

  def self.find_by_range(start_date, end_date)
    menus = []
    (start_date..end_date).each do |day|
      menus.push Menu.new(date: day)
    end
    menus
  end

  def persisted?
    false
  end

  def save
    if valid?
      destroy
      persist!
      true
    else
      false
    end
  end

  def destroy
    ActiveRecord::Base.transaction do
      BreakfastOption.destroy_all(serving_date: serving_date)
      LunchOption.destroy_all(serving_date: serving_date)
      SupperOption.destroy_all(serving_date: serving_date)
    end
  end

  private

  def persist!
    ActiveRecord::Base.transaction do
      BreakfastOption.create_all_by_serving_date!(serving_date,
                                                  breakfast_choices)
      LunchOption.create_all_by_serving_date!(serving_date, lunch_choices)
      SupperOption.create_all_by_serving_date!(serving_date, supper_choices)
    end
  end
end