Brand::Application.routes.draw do
  get "product/categories"

  get "product/product_list"

  get "product/product"

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

  get "product/categories"

  match "product/product_list/:id" => "product#product_list"

  match "product/products/:id" => "product#product"

  root :to => "home#index"
end
