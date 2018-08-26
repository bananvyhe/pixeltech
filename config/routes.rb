Rails.application.routes.draw do
   
  get 'errors/not_found'
  get 'errors/internal_server_error'
   
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :users do
    get :admination, on: :member
    get :deadmination, on: :member
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
  root 'landing_page#index'
 
  match "/404", :to => "errors#not_found", :via => :all
	match "/500", :to => "errors#internal_server_error", :via => :all
end
