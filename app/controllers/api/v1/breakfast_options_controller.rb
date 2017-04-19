class Api::V1::BreakfastOptionsController < ApplicationController
  before_action :set_breakfast_option, only: [:show, :update, :destroy]

  # GET /breakfast_options
  def index
    @breakfast_options = BreakfastOption.all

    render json: @breakfast_options
  end

  # GET /breakfast_options/1
  def show
    render json: @breakfast_option
  end

  # POST /breakfast_options
  def create
    @breakfast_option = BreakfastOption.new(breakfast_option_params)

    if @breakfast_option.save
      render json: @breakfast_option, status: :created, location: v1_breakfast_option_url(@breakfast_option)
    else
      render json: @breakfast_option.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /breakfast_options/1
  def update
    if @breakfast_option.update(breakfast_option_params)
      render json: @breakfast_option
    else
      render json: @breakfast_option.errors, status: :unprocessable_entity
    end
  end

  # DELETE /breakfast_options/1
  def destroy
    @breakfast_option.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_breakfast_option
    @breakfast_option = BreakfastOption.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def breakfast_option_params
    params.require(:breakfast_option).permit(:serving_date, :meal_id)
  end
end
