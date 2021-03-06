Choopro::Application.routes.draw do

    resources :replies

  resources :services
  resources :pictures
  resources :pros
  resources :requests
  resources :messages
  resources :message_copies
  resources :folders
  resources :message_recipients
  devise_for :admins
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  get "mailbox/show"
  get "sent/index"
  get "sent/show"
  get "sent/new"
  get "sent/create"
  match 'sent/create' => 'sent#create'
  get "bid/show"

  get "messages/inbox"
  get "messages/sent"


  match 'inbox' => 'mailbox#index'

  #controller company
  get "company/about"
  get "company/equipe"
  get "company/carriere"
  get "company/logo"
  get "company/contact"
  get "company/presse"


  #controller pros
  get "pros/new"
  get "pros/create"
  
  match 'pros/:id/promote_services' => 'pros#promote_services'
  
  get "pros/edit"
  match 'pros/:id/edit' => 'pros#edit', :as => :edit_profil
  
  get "pros/update"
  
  get "pros/services"
  match 'pros/:id/services' => 'pros#services', :as => :edit_services
  
  get "pros/photos"
  match 'pros/:id/photos' => 'pros#photos', :as => :edit_photos
  
  get "pros/edit_photo"
  match 'pros/:id/edit_photo' => 'pros#edit_photo', :as => :edit_photo
  
  match 'requests/:id/bids' => 'requests#bids', :as => :bids  
  
  #match ":business_name" => 'pros#show', :as => :business_name
  match ":city/:business_name" => 'home#show_pro', :as => :business_name
 
  #controller promote
  get "promote/verified"
  get "promote/reviews"
  get "promote/futured"
  get "promote/domain"
  get "promote/network"
  get "promote/widgets"
  get "promote/advertise_quideal"
  get "promote/advertise_choopro"
  
  
  #controller search
  get "search/index"
  match "search" => 'search#index'
  
  #match ':controller/:action/:id'
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  get "home/index"
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
