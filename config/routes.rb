Rails.application.routes.draw do
  
constraints subdomain: 'api' do
	  
	  # Scope: Allows routing to controllers without showing it in the URL
	  scope module: 'api' do
	    
	    namespace :v1 do # Routing to the V1 module.. We also want it to appear in our URL.
	      
	      resources :users
	      resources :meals
	    
	    end
	  end
	end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
