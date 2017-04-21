class Menu < ActiveModelSerializers::Model
  include ActiveModel::Model

  attr_accessor :date

  def breakfast_options
    BreakfastOption.where(serving_date: date)
  end

  def lunch_options
    LunchOption.where(serving_date: date)
  end

  def supper_options
    SupperOption.where(serving_date: date)
  end

  def self.fetch_range(start_date, end_date)
    menus = []
    (start_date..end_date).each do |day|
      menus.push Menu.new(date: day)
    end
    menus
  end

  def self.create(attributes)
    date = Date.parse(attributes[:date])
    breakfast_options = attributes[:breakfast_options]
    lunch_options = attributes[:lunch_options]
    supper_options = attributes[:supper_options]

    ActiveRecord::Base.transaction do
      create_breakfast_options(date, breakfast_options)
      create_lunch_options(date, lunch_options)
      create_supper_options(date, supper_options)
    end
    Menu.new date: date
  end

  def self.create_breakfast_options(date, breakfast_options)
    return if breakfast_options.nil?
    breakfast_options.each do |breakfast_option|
      BreakfastOption.create(serving_date: date, meal_id: breakfast_option[:meal_id])
    end
  end

  def self.create_lunch_options(date, lunch_options)
    return if lunch_options.nil?
    lunch_options.each do |lunch_options|
      LunchOption.create(serving_date: date, meal_id: lunch_options[:meal_id])
    end
  end

  def self.create_supper_options(date, supper_options)
    return if supper_options.nil?
    supper_options.each do |supper_options|
      SupperOption.create(serving_date: date, meal_id: supper_options[:meal_id])
    end
  end
end