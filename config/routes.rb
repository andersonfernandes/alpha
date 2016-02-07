Rails.application.routes.draw do
  root 'users#my_profile'

  devise_for :users, controllers: { registrations: "custom_devise/registrations" }

  resources :users, only: [:show]
  get 'my_profile' => 'users#my_profile'
end
