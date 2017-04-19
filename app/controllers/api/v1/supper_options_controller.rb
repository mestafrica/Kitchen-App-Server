class Api::V1::SupperOptionsController < ApplicationController
  before_action :set_supper_option, only: [:show, :update, :destroy]

  # GET /supper_options
  def index
    @supper_options = SupperOption.all

    render json: @supper_options
  end

  # GET /supper_options/1
  def show
    render json: @supper_option
  end

  # POST /supper_options
  def create
    @supper_option = SupperOption.new(supper_option_params)

    if @supper_option.save
      render json: @supper_option, status: :created, location: v1_supper_option_url(@supper_option)
    else
      render json: @supper_option.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /supper_options/1
  def update
    if @supper_option.update(supper_option_params)
      render json: @supper_option
    else
      render json: @supper_option.errors, status: :unprocessable_entity
    end
  end

  # DELETE /supper_options/1
  def destroy
    @supper_option.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_supper_option
    @supper_option = SupperOption.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def supper_option_params
    params.require(:supper_option).permit(:serving_date, :meal_id)
  end
end
