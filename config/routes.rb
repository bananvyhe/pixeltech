require "sidekiq/web"

Rails.application.routes.draw do
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    # Protect against timing attacks:
    # - See https://codahale.com/a-lesson-in-timing-attacks/
    # - See https://thisdata.com/blog/timing-attacks-against-string-comparison/
    # - Use & (do not use &&) so that it doesn't short circuit.
    # - Use digests to stop length information leaking (see also ActiveSupport::SecurityUtils.variable_size_secure_compare)
    ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(username), ::Digest::SHA256.hexdigest(ENV["SIDEKIQ_USERNAME"])) &
      ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(password), ::Digest::SHA256.hexdigest(ENV["SIDEKIQ_PASSWORD"]))
  end if Rails.env.production?
  mount Sidekiq::Web, at: "/sidekiq"
  
  resources :inboxes
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


  
  # get   '/кошелек/пополнить', :to=> 'siteowners#replenishment', :as => :replenishment
  # post  '/пополнение/счета', :to=> 'siteowners#payment_process', :as => :payment_process
  # get   '/платеж/не/прошел', :to=> 'siteowners#payment_fail', :as => :payment_fail
  # get   '/платеж/прошел/:secure_code', :to=> 'siteowners#payment_success', :as => :payment_success 


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
      post :inb, to: "inboxes#create"

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
