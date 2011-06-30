Brand::Application.routes.draw do
  resources :events

  resources :users

  resources :articles
  root :to => "home#index"
end
