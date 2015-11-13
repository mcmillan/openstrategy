Rails.application.routes.draw do
  # users
  devise_for :users, skip: :sessions, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :users, only: [:show]

  # admin
  ActiveAdmin.routes(self)

  # app
  root to: 'categories#index'
  resources :categories, only: [:index, :show]
  resources :suggestions, only: [:create]
  resources :products, only: [] do
    member do
      get 'image'
      get 'go'
    end
    resources :favorites, only: [:create] do
      delete on: :collection, action: :destroy
    end
  end
  resources :favorites, only: :index
  resources :emails, only: :create
end
