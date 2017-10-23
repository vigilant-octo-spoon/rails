Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :user,  path: 'users'
  resources :methodology, path: 'methodologies'
  resources :sessions, only: [:create,:destroy]
  resources :follows_methodology, path: 'follows'
  resources :follows_methodology, path: 'follows' do
      resources :plannings, only: [:show,:create,:update]
  end
  resources  :plannings, only: [:index]

  get '/follows/:follows_methodology_id/plannings/', to: 'planning#show_follow', as: 'show_follow_planning'
end
