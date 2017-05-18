Rails.application.routes.draw do
  resources :shows
  resources :characters
  root "application#index"

  delete "/logout" => "sessions#destroy"
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
