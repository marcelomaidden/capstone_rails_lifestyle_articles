Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'users#login'
  get '/login', to: 'users#login'
  get '/logout', to: 'users#logout'
  post '/signin', to: 'users#signin'

  resources :users, only: [:new, :show, :update, :index, :create, :edit]
  resources :categories, only: [:show]
end
