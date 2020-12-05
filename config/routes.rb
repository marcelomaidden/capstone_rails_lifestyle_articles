Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'articles#index'
  get '/login', to: 'users#login'
  get '/logout', to: 'users#logout'
  post '/signin', to: 'users#signin'

  resources :users, only: [:new, :show, :update, :index, :create, :edit] do
    resources :articles 
  end

  resource :votes 

  resources :articles

  resources :categories, only: [:show] do 
    resources :articles
  end
end
