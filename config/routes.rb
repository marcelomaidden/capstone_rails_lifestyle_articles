Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/login', to: 'users#login'
  get '/logout', to: 'users#logout'
  post '/signin', to: 'users#signin'

  resources :users, only: [:new, :show, :update, :index, :create]
end
