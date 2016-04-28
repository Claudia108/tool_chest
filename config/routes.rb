Rails.application.routes.draw do
  root 'sessions#new'
  # resources :tools
  resources :categories , only: [:index, :show]

  namespace :admin do
    resources :categories, except: [:show]
    resources :tools
  end

  resources :users, except: [:index] do
    resources :tools
  end

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

end
