Rails.application.routes.draw do
  devise_for :users
  resources :tasks, except: [:index, :destroy]
  root to: 'home#index'
end
