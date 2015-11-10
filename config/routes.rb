Rails.application.routes.draw do
  # users
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
  }
  resources :users, only: [:show]

  # admin
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # app
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

  # cors shit
  match '*path', controller: 'application', action: 'handle_options_request', via: :options
end
