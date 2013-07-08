ShoppingCart::Application.routes.draw do
  resources :user_preferences
  get "user_preferences/details/:id" => 'user_preferences#details', :as => 'user_preferences_details'
  
  resources :menus
  get "new_user_menu" => 'menus#new_user_menu', :as => 'new_user_menu'
  post "create_menu_for_user" => "menus#create_menu_for_user", :as => 'create_menu_for_user'
  get 'show_shopping_list' => "menus#show_shopping_list", :as => 'show_shopping_list'
  get 'show_menu_for_user' => "menus#show_menu_for_user", :as => 'show_menu_for_user'
  get 'send_shopping_list' => 'menus#send_shopping_list', :as => 'send_shopping_list'
  
  devise_for :users
  resources :ingredients
  resources :recipes
  resources :tags
  get "assign-tag-to-user" => 'tags#assign_to_user', :as => 'tags_assign_to_user'
  put "update-tags-for-user" => "tags#update_tags_for_user", :as => 'update_tags_for_user'
  
  resources :measures

  get "home/index"
  get "home/user_home"
  get "home/administrator_home"

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
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
