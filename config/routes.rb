Brand::Application.routes.draw do
  resources :users

  resources :articles
  root :to => "home#index"
end
