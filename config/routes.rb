Rails.application.routes.draw do

  root 'users#new'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  post 'login', to: 'sessions#create'
  get '/welcome', to: 'sessions#welcome'
  get 'edit_profile', to: 'users#edit'
end
