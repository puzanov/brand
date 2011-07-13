Brand::Application.routes.draw do
  get "map/index"

  match "auth/login" => "auth#login"

  get "auth/logout"

  get "auth/profile"

  resources :events

  resources :users

  resources :articles
  root :to => "home#index"
end
