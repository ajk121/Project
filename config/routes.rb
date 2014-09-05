Cookbook2::Application.routes.draw do
  resources :posts

  get 'logout', to: 'sessions#destroy', as: 'logout'
  
  root to: 'home#home'

  match 'search', to: 'recipes#search', via: [:get, :post], as: :search

  resources :recipes 
  resources :categories 
  resources :ingredients
  resources :users
  resources :sessions
  resources :comments
 
end
