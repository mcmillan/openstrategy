Rails.application.routes.draw do
  match '*path', to: 'static#nope', via: :all
end
