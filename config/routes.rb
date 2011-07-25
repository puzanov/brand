Brand::Application.routes.draw do
  get "map/index"

  match "auth/login" => "auth#login"

  get "auth/logout"

  get "auth/profile"

  match "users/check_password" => "users#check_password"

  resources :events

  resources :users do
    member do
      get 'edit_password'
    end
  end
  

  resources :articles

  get "products/categories"

  match "products/product_list/:id" => "products#product_list"

  match "products/product/:id" => "products#product"

  root :to => "home#index"
end
