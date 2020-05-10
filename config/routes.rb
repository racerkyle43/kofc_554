Rails.application.routes.draw do
  get 'newsletters/index'
  get 'newsletters/new'
  get 'newsletters/create'
  get 'newsletters/destroy'
  resources :users, only: [:new, :create]
  resources :newsletters, only: [:index, :new, :create, :destroy]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'logout', to: 'sessions#logout'
  get 'authorized', to: 'sessions#page_requires_login'
  get 'welcome/index'

  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
