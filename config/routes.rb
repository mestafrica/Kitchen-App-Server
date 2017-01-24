Rails.application.routes.draw do
  
  scope module: 'api' do
    namespace :v1 do
      resources :users
    end
  end

  #from Now on routes go like this: 
  # 1. /v1/users = to access all users
  # 2. /v1/users/1 = to access one user
  #resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
