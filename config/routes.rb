Rails.application.routes.draw do

  match '/home', to: 'main#index', via: [:get, :post]
  match '/about', to: 'main#about', via: [:get, :post]
  match '/contact', to: 'main#contact', via: [:get, :post]
  resources :posts
  resources :photos, only: [:index, :new, :create, :show, :destroy]

  root 'main#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
