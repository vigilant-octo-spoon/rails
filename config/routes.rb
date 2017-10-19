Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :user,  path: 'users'
  resources :methodology, path: 'methodologies'
  resources :sessions, only: [:create,:destroy]
  resources :follows_methodology, path: 'follows'
end
