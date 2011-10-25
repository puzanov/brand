Brand::Application.routes.draw do
  resources :common_prices

  resources :prices

  get "product/categories"

  get "product/product_list"

  get "product/product"

  get "map/index"

  match "auth/login" => "auth#login"

  get "auth/logout"

  get "auth/profile"

  match "users/:id/check_password" => "users#check_password"

  match "users/:id/edit_password" => "users#edit_password"
 
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

  match "/upload_img" => "articles#upload_img"

  root :to => "home#index"

  match '*a', :to => 'errors#routing'
end
