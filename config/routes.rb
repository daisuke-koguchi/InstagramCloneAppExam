Rails.application.routes.draw do
  root to: 'users#index'
  resources :users 
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:index, :create, :destroy]
  resources :blogs do
    collection do
      post :confirm
      get :user_like 
    end
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
