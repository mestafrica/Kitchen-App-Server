class Menu < ActiveModelSerializers::Model
  include ActiveModel::Model

  attr_accessor :date

  def breakfast_options
    BreakfastOption.where(serving_date: date)
  end

  def breakfast_options=(value)
    @breakfast_options = value
  end


  def lunch_options
    LunchOption.where(serving_date: date)
  end

  def lunch_options=(value)
    @lunch_options = value
  end


  def supper_options
    SupperOption.where(serving_date: date)
  end

  def supper_options=(value)
    @supper_options = value
  end


  def self.fetch_range(start_date, end_date)
    menus = []
    (start_date..end_date).each do |day|
      menus.push Menu.new(date: day)
    end
    menus
  end

  def save
    ActiveRecord::Base.transaction do
      unless @breakfast_options.nil?
        @breakfast_options.each do |breakfast_option|
          BreakfastOption.create(breakfast_option)
        end
      end

      unless @lunch_options.nil?
        @lunch_options.each do |lunch_options|
          LunchOption.create(lunch_options)
        end
      end

      unless @supper_options.nil?
        @supper_options.each do |supper_options|
          SupperOption.create(@supper_options)
        end
      end
    end
  end
end