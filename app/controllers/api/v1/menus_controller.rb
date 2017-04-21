class Api::V1::MenusController < ApplicationController
  # before_action :set_menu, only: [:show, :update, :destroy]

  # GET /menus
  def index
    start_date = Date.parse params[:start_date]
    end_date = Date.parse params[:end_date]
    @menus = Menu.fetch_range(start_date, end_date)

    render json: @menus, include: %w(breakfast_options.meal lunch_options.meal supper_options.meal)
  end

  # GET /menus/1
  def show
    date = Date.parse params[:id]
    @menu = Menu.new(date: date)

    render json: @menu, include: %w(breakfast_options.meal lunch_options.meal supper_options.meal)
  end

  # POST /menus
  def create
    @menu = Menu.create(date: menu_params[:date],
                        breakfast_options: menu_params[:breakfast_options],
                        lunch_options: menu_params[:lunch_options],
                        supper_options: menu_params[:supper_options])

    render json: @menu, include: %w(breakfast_options.meal lunch_options.meal supper_options.meal), status: :created#, location: v1_menu_url @menu

    # if @menu.save
    #   render json: @menu, include: ['breakfast_options.meal'], status: :created#, location: v1_menu_url @menu
    # else
    #   render json: @menu.errors, status: :unprocessable_entity
    # end
  end

  # PATCH/PUT /menus/1
  def update
    if @menu.update(menu_params)
      render json: @menu
    else
      render json: @menu.errors, status: :unprocessable_entity
    end
  end

  # DELETE /menus/1
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
    params.fetch(:menu, {})
  end
end
