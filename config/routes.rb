Rails.application.routes.draw do
  #get 'sessions/new'
  # root 'sessions#new'
  # get 'login', to: 'sessions#new'
  # get 'signup', to: 'users#new'
  # post 'login', to: 'sessions#create'

  # delete 'logout', to: 'sessions#destroy'
  # # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :sessions
  # resources :users

  
  resources :users, only: [:new, :create]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/welcome', to: 'sessions#welcome'
  delete 'logout'  => 'sessions#destroy'
end
