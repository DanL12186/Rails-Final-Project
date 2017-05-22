Rails.application.routes.draw do

  root "application#home"

  resources :users do
    resources :characters, only: [:index]
    resources :shows do
      resources :characters
    end
  end

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"

  get '/auth/facebook/callback' => "sessions#omnicreate"

end
