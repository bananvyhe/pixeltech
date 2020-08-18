require "sidekiq/web"


Rails.application.routes.draw do
  resources :gameboards
  resources :vks
  resources :inboxes
  resources :siteowners
  resources :clients
  resources :voodoo
  get 'errors/not_found'
  get 'errors/internal_server_error'
   
  devise_for :users, controllers: { registrations: 'registrations', passwords: 'users/passwords' } 
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
      get :vks, to: "vks#index"
      post :auth, to: "authentication#create"
      post :refr, to: "refresh#create"
      post :inb, to: "inboxes#create"
      post :vk, to: "vks#create"
      get :vkgrget, to: "vks#grget"
      # post :vkgrpost , to: "vks#grpost"      
      get :lobbyall, to: "users#lobbyall"
      post :vkwall, to: "vks#associate"
      post :request, to: "request#message"
      post :kill, to: "gameboards#kill"
      post :vote, to: "gameboards#vote"
      get :gameboard, to: "gameboards#index"
      get :userinfo, to: "gameboards#userinfo"
      get :vuepost, to: "vueposts#index"
      post :vuepost, to: "vueposts#create"
      post :votepost, to: "vueposts#votepost"
      get :getrait, to: "vueposts#getrait"
      get :vuepostshow, to: "vueposts#show"
      get :vuecommshow, to: "vueposts#shocomm"
      get :getPkStatus, to: "gameboards#getPkStatus"
      post :ressurect, to: "gameboards#ressurect"
      post :chat, to: "chats#create"
      get :chat, to: "chats#index"
      # post :vuepost, to: "vueposts#destroy"
      resources :vueposts
      
      resources :vks
      resources :users
      resources :locations do
        resources :recordings
      end
    end
  end
  resources :posts do
    resources :comments, module: :posts
  end
  resources :my_items  do 
    member do
      post :use_item
      patch :move
    end
  end 
  # namespace :my_items do 
  #   get :check_clan, to: "my_items#check_clan"
  # end
  get 'my_item/check_clan', to: 'my_items#check_clan'
  post 'my_items/paste_clan', to: 'my_items#paste_clan'
  # resources :discussios do
  #   resources :comments, module: :discussios
  # end
  root to: 'posts#index'
  resources :locations
  resources :discussions do
    resources :comments, module: :discussions
  end
  match "/404", :to => "errors#not_found", :via => :all
	match "/500", :to => "errors#internal_server_error", :via => :all
  Sidekiq::Web.set :session_secret, Rails.application.credentials[:secret_key_base]
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    # Protect against timing attacks:
    # - See https://codahale.com/a-lesson-in-timing-attacks/
    # - See https://thisdata.com/blog/timing-attacks-against-string-comparison/
    # - Use & (do not use &&) so that it doesn't short circuit.
    # - Use digests to stop length information leaking (see also ActiveSupport::SecurityUtils.variable_size_secure_compare)

    login_hash = ::Digest::SHA256.hexdigest(username)
    password_hash = ::Digest::SHA256.hexdigest(password)

    ActiveSupport::SecurityUtils.secure_compare(login_hash, ::Digest::SHA256.hexdigest(Rails.application.credentials.username)) &
      ActiveSupport::SecurityUtils.secure_compare(password_hash, ::Digest::SHA256.hexdigest(Rails.application.credentials.password))
  end # if Rails.env.production?
  mount Sidekiq::Web, at: "/sidekiq"
end
