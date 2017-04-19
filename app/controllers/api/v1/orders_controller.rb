module Api::V1
  class OrdersController < ApplicationController
    before_action :set_order, only: [:show, :update, :destroy]

    def index
      @order = Order.all

      render json: @order
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

    private

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
