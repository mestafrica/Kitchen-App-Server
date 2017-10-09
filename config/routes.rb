Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # Scope: Allows routing to controllers without showing it in the URL
  scope module: 'api' do
    namespace :v1 do
      resources :users # Routing to the V1 module.. We also want it to appear in our URL.
      resources :meals
      resources :orders
      resources :supper_options
      resources :lunch_options
      resources :breakfast_options
      resources :menus

      get 'menus/:start_date/:end_date', to: 'menus#index'

      get 'order_summary/breakfast/:serving_date', to: 'orders#order_summary_for_breakfast'
      get 'order_summary/lunch/:serving_date', to: 'orders#order_summary_for_lunch'
      get 'order_summary/supper/:serving_date', to: 'orders#order_summary_for_supper'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
