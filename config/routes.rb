Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  namespace :api do
    resources :recipes, only: [:index, :show]
  end

  root 'users#index', as: :users

  patch 'users/:id' => 'users#update'
  patch 'recipes/:id' => 'recipes#update'

  get '/users' => 'users#index'
  get 'users/new' => 'users#new', as: :new_user
  get 'users/:id' => 'users#show', as: :user
  get 'users/:id/edit' => 'users#edit', as: :edit_user

  get 'sessions/new' => 'sessions#new', as: :new_session
  get 'sessions/destroy' => 'sessions#destroy', as: :destroy_session

  get 'targets/' => 'targets#index', as: :targets

  get 'restaurants/new' => 'restaurants#new', as: :new_restaurant
  get 'restaurants/' => 'restaurants#index', as: :restaurants
  get 'restaurants/:id' => 'restaurants#show', as: :restaurant

  get 'recipes/' => 'recipes#index', as: :recipes
  get 'recipes/new' => 'recipes#new', as: :new_recipe
  get 'recipes/:id' => 'recipes#show', as: :recipe
  get 'recipes/:id/edit' => 'recipes#edit', as: :edit_recipe

  get 'comments/' => 'comments#index', as: :comments

  post 'sessions/new' => 'sessions#create', as: :create_session
  post '/' => 'users#create'
  post 'restaurants/' => 'restaurants#create'
  post 'recipes/' => 'recipes#create'
  post 'comments/' => 'comments#create'
  post 'recipes/:id/likes/' => 'recipes#like', as: :like_recipe

  delete 'recipes/:id' => 'recipes#destroy'
  delete 'comments/:id' => 'comments#destroy', as: :comment_recipe
  delete 'users/:id' => 'users#destroy', as: :delete_user


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
