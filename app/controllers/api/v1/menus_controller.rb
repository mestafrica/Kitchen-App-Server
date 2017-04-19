module Api::V1
  class MenusController < ApplicationController
    before_action :set_menu, only: [:show, :update, :destroy]

    def index
      @menus = Menu.all
      render json: @menus
    end

    def show
      render json: @menu
    end

    def create
      @menu = Menu.new(menu_params)
      @menu.menu_date = Date.parse(menu_params[:menu_date])

      if @menu.save
        # TODO: Figure out why location: throws an
        #   'undefined method `menu_url` exception' when the code below is run
        #   render json: @menu, status: :created, location: @menu
        render json: @menu
      else
        render json: @menu.errors, status: :unprocessable_entity
      end
    end

    def update
      if @menu.update(menu_params)
        render json: @menu
      else
        render json: @menu.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @menu.destroy
    end

    private

    def set_menu
      @menu = Menu.find(params[:id])
    end

    def menu_params
      params.require(:menu).permit(:menu_date,
                                   breakfast_choices: [],
                                   lunch_choices: [],
                                   supper_choices: [])
    end
  end
end
