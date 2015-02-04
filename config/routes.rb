Rails.application.routes.draw do
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
  end
  resources :emails, only: :create

  # cors shit
  match '*path', controller: 'application', action: 'handle_options_request', via: :options
end
