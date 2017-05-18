Rails.application.routes.draw do

  root "application#home"

  resources :shows

  resources :users do
    resources :characters
  end


  delete "/logout" => "sessions#destroy"
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
