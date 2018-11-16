Rails.application.routes.draw do
   
  resources :siteowners
  resources :clients
  resources :voodoos
  get 'errors/not_found'
  get 'errors/internal_server_error'
   
  devise_for :users, controllers: { registrations: 'registrations' } 
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_use
  root 'landing_page#index'
  resources :users do
    get :admination, on: :member
    get :deadmination, on: :member
    get :voodooation, on: :member
    get :devoodooation, on: :member
    get :clientation, on: :member
    get :declientation, on: :member
  end
   
  resources :lists do
  	member do
  		patch :move
  	end
  end
  resources :cards do
  	member do
  		patch :move
  	end
  end
  namespace :api do
    namespace :v1 do
      post :auth, to: "authentication#create"
       post :refr, to: "refresh#create"
      resources :users
      resources :locations do
        resources :recordings
      end
    end
  end

  resources :locations
 
  match "/404", :to => "errors#not_found", :via => :all
	match "/500", :to => "errors#internal_server_error", :via => :all
end
