Rails.application.routes.draw do

  root "application#home"

  resources :users do
    resources :shows do
      resources :characters
    end
  end

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"

  get "/users/:id/shows/all/favorite_characters" => "characters#favorite_characters"

  get '/auth/facebook/callback' => 'sessions#omnicreate'

end
