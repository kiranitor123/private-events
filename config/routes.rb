Rails.application.routes.draw do
  get 'invitations/sessions'
  get 'users/index'
  resources :events
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
