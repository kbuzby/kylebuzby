Rails.application.routes.draw do

  root 'main#index'

  #mainly static pages
  match '/home', to: 'main#index', via: [:get, :post]
  match '/about', to: 'main#about', via: [:get, :post]
  match '/contact', to: 'main#contact', via: [:get, :post]

  #login / logout pages
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  #ActiveRecord resource pages
  resources :posts
  resources :photos, only: [:index, :new, :create, :show, :destroy]
  resources :users, only: [:new, :create, :edit, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
