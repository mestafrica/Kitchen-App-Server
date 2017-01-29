module Api::V1
   class MenusController < ApplicationController

       def index
           @menu = Menu.all
           render json: @menu
       end

       def show
           @menu = Menu.find(params[:id])
           render json: @menu
       end


       def create
           @menu = Menu.new
           @menu.day_created = Date.parse(menu_params['day_created'])
           @menu.breakfast = menu_params['breakfast'].split(',')
           @menu.lunch = menu_params['lunch'].split(',')
           @menu.supper = menu_params['supper'].split(',')

           #puts "------------------------"

           if @menu.save
               puts "its saved"
               render json: @meal, status: :created, location: @meal
           else
               puts @menu.errors.full_messages
               render json: @meal.errors, status: :unprocessable_entity
           end

           #puts menu_params.inspect

           #puts "##########################"

           #puts @menu.inspect
       end
       
       
       def update
           @menu = Menu.find_by_id(params[:id])

           puts @menu

           @menu.day_created = Date.parse(menu_params['day_created'])
           @menu.breakfast = menu_params['breakfast'].split(',')
           @menu.lunch = menu_params['lunch'].split(',')
           @menu.supper = menu_params['supper'].split(',')

           if @menu.save
               puts "its saved"
               #render json: @meal, status: :created, location: @meal
           else
               puts @menu.errors.full_messages
               #render json: @meal.errors, status: :unprocessable_entity
           end

       end


       def destroy
           @meal = Menu.find(params[:id])

           if @meal.destroy
               render true
           else
               render false
           end
       end



       def menu_params
           params.require(:menu).permit(:id, :day_created, :breakfast, :lunch, :supper)
       end


   end 
end
