Rails.application.routes.draw do
  # user authentication with devise gem
  devise_for :users
  root 'messages#index'
  resources :users, only: [:edit, :update]
end
