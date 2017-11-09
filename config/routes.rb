Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :user,  path: 'users'
  resources :methodology, path: 'methodologies'
  resources :sessions, only: [:create,:destroy]
  resources :follows_methodology, path: 'follows'
  resources :follows_methodology, path: 'follows' do
      resources :planning, only: [:destroy,:show, :create]
      resources :work_role, only: [:destroy, :create, :index]
      resources :resource, only: [:destroy, :create,:index]
      resources :condition, only: [:destroy, :create,:index]
      resources :broadcast, only: [:destroy, :create,:index]
      resources :binnacle, only: [:show,:destroy, :create,:index]
      resources :evaluation, only: [:destroy, :index, :create]
      resources :report, only: [:destroy,:index, :create]

  end
  resources  :plannings, only: [:index]

  get '/follows/:follows_methodology_id/plannings/', to: 'planning#show_follow', as: 'show_follow_planning'
  get '/follows_all_users/', to: 'follows_methodology#all_users', as: 'follows_all_users'
end
