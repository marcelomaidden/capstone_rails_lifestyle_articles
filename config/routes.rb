Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/show'
  get 'categories/new'
  get 'categories/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'articles#index'
  get '/login', to: 'users#login'
  get '/logout', to: 'users#logout'
  post '/signin', to: 'users#signin'
  get '/suggestions', to: 'articles#suggestions'
  
  resources :users, only: [:new, :show, :update, :index, :create, :edit] do
    resources :articles, only: [:new, :show, :update, :edit, :create, :index] 
  end

  resource :votes, only: [:new, :edit] 

  resources :articles, only: [:new, :show, :update, :edit, :create, :index]

  get '/search', to: 'articles#search'

  resources :categories, only: [:new, :edit, :index, :create, :update] do 
    resources :articles, only: [:new, :show, :update, :edit, :create, :index]
  end
end
