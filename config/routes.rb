Rails.application.routes.draw do
  get '/api-docs', to: redirect('/api-docs.html')

  # Scope: Allows routing to controllers without showing it in the URL
  scope module: 'api' do
    namespace :v1 do
      resources :users # Routing to the V1 module.. We also want it to appear in our URL.
      resources :meals
      resources :orders
      resources :supper_options
      resources :lunch_options
      resources :breakfast_options
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
