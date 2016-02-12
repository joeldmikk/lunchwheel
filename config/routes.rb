Rails.application.routes.draw do

  root 'restaurants#index'

  resources :restaurants
  resources :groups

  post '/spinner', to: 'restaurants#spin', as: 'spin_the_wheel'
  get '/spinner', to: 'restaurants#spin'

  get '/search', to: 'restaurants#search', as: 'search_for_restaurant'
  post '/find', to: 'restaurants#find', as: 'find_restaurant'
  post '/popular', to: 'restaurants#popular', as: 'popular_restaurant'

  post '/find/add/:id', to: 'restaurants#add_restaurant_to_group', as: 'add_restaurant_to_group'

  post '/groups/:id/select_group', to: 'groups#select_group', as: 'select_group'
  post '/groups/:id/set_current_group', to: 'groups#set_current_group', as: 'set_current_group'


  # Current Group stuff
  get '/reset_session', to: 'application#reset_session_wrap', as: 'reset_session'





  # OAUTH STUFF

  get "signout" => "sessions#destroy", :as => "signout"
  get "signin"  => "sessions#new",     :as => "signin"

  resources :sessions, only: [:create]

  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback"
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
