Rails.application.routes.draw do
  devise_for :users
  resources :tasks, except: [:index, :destroy] do
    resources :comments, only: :create
  end
  root to: 'home#index'
end
