class Api::V1::MenusController < ApplicationController
  before_action :set_menu, only: [:show, :update, :destroy]

  # GET /menus
  def index
    start_date = Date.parse params[:start_date]
    end_date = Date.parse params[:end_date]
    @menus = Menu.find_by_range(start_date, end_date)

    render json: @menus, include: '*.meal'
  end

  # GET /menus/2017-05-01
  def show
    render json: @menu, include: '*.meal'
  end

  # POST /menus
  def create
    @menu = Menu.new(menu_params)

    if @menu.save
      render json: @menu, include: '*.meal', status: :created
    else
      render json: @menu.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /menus/2017-05-01
  def update
    @menu = Menu.update(date: params[:id],
                        breakfast_options: menu_params[:breakfast_options],
                        lunch_options: menu_params[:lunch_options],
                        supper_options: menu_params[:supper_options])

    if @menu.update(menu_params)
      render json: @menu, include: '*.meal'
    else
      render json: @menu.errors, status: :unprocessable_entity
    end
  end

  # DELETE /menus/2017-05-01
  def destroy
    @menu.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_menu
    @menu = Menu.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def menu_params
    params.require(:menu).permit(:serving_date,
                                 breakfast_choices: [],
                                 lunch_choices: [],
                                 supper_choices: [])
  end
end
