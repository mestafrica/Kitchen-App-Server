module Api::V1
  class OrdersController < ApplicationController
    before_action :set_order, only: [:show, :update, :destroy]

    def index
      params[:start_date] ? start_date = Date.parse(params[:start_date]) : start_date = Date.parse('1970-01-01')
      params[:end_date] ? end_date = Date.parse(params[:end_date]) : end_date = Date.today

      @orders = Order.where(serving_date: start_date..end_date)

      render json: @orders
    end

    def show
      render json: @order
    end

    def create
      @order = Order.new(order_params)

      if @order.save
        render json: @order
      else
        render json: @order.errors, status: :unprocessable_entity
      end
    end

    def update
      if @order.update(order_params)
        render json: @order
      else
        render json: @order.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @order.destroy
    end

    def order_summary_for_breakfast
      render json: order_summary_for
    end

    def order_summary_for_lunch
      render json: order_summary_for(LunchOption)
    end

    def order_summary_for_supper
      render json: order_summary_for(SupperOption)
    end

    private

    def order_summary_for(option_type = BreakfastOption)
      histogram = []
      options = option_type.where(serving_date: params[:serving_date])
      options.each do |option|
        bin = {}
        bin[:meal_id] = option.meal_id
        bin[:meal_name] = option.meal.name
        bin[:order_count] = get_order_count(option)
        histogram.push bin
      end
      histogram
    end

    def get_order_count(option)
      if option.is_a? BreakfastOption
        Order.where(breakfast_id: option.meal_id).size
      elsif option.is_a? LunchOption
        Order.where(lunch_id: option.meal_id).size
      elsif option.is_a? SupperOption
        Order.where(supper_id: option.meal_id).size
      end
    end

    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:user_id,
                                    :serving_date,
                                    :breakfast_id,
                                    :lunch_id,
                                    :supper_id)
    end
  end
end
