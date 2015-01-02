Rails.application.routes.draw do
  # admin
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # app
  root to: 'categories#index'
  resources :categories, only: [:index, :show]
  resources :suggestions, only: [:new, :create]
  resources :products, only: [] do
    member do
      get 'image'
      get 'go'
    end
  end

  # cors shit
  match '*path', controller: 'application', action: 'handle_options_request', via: :options
end
