Rails.application.routes.draw do
  root to: 'static#nope'
  match '*path', to: 'static#nope', via: :all
end
