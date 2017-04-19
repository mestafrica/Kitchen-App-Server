class Api::V1::LunchOptionsController < ApplicationController
  before_action :set_lunch_option, only: [:show, :update, :destroy]

  # GET /lunch_options
  def index
    @lunch_options = LunchOption.all

    render json: @lunch_options
  end

  # GET /lunch_options/1
  def show
    render json: @lunch_option
  end

  # POST /lunch_options
  def create
    @lunch_option = LunchOption.new(lunch_option_params)

    if @lunch_option.save
      render json: @lunch_option, status: :created, location: v1_lunch_option_url(@lunch_option)
    else
      render json: @lunch_option.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lunch_options/1
  def update
    if @lunch_option.update(lunch_option_params)
      render json: @lunch_option
    else
      render json: @lunch_option.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lunch_options/1
  def destroy
    @lunch_option.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_lunch_option
    @lunch_option = LunchOption.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def lunch_option_params
    params.require(:lunch_option).permit(:serving_date, :meal_id)
  end
end
