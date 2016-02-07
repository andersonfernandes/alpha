Rails.application.routes.draw do
  root 'users#show'

  devise_for :users, controllers: { registrations: "custom_devise/registrations" }

  resources :users, only: [:show]
end
