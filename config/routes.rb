Rails.application.routes.draw do
  # admin
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  # app
  root to: 'categories#index'
  resources :categories, only: [:show]
  resources :suggestions, only: [:new, :create]
end
