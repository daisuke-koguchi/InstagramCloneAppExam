Rails.application.routes.draw do
  root to: 'users#index'
  resources :users, only: [:index, :new, :create, :show,:edit,:update]
  resources :sessions, only: [:new, :create, :destroy]
  
end
