Rails.application.routes.draw do

  root "application#home"

  resources :users do
    resources :shows do
      resources :characters
    end
  end


  delete "/logout" => "sessions#destroy"
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
