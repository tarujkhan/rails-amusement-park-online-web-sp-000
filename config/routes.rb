Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'application#home'
  resources :users
  resources :sessions
  get '/signin', to: 'sessions#new', as: :signin
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/index', to: 'attractions#index'
end
