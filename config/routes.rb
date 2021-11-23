Rails.application.routes.draw do
  root to: 'users#index'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :blogs
end
