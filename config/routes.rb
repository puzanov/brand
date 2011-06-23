Brand::Application.routes.draw do
  resources :articles
  root :to => "home#index"
end
