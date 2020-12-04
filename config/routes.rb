Rails.application.routes.draw do
  get 'items/search'
  get 'cards/new'
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :orders, only: [:index, :create]
  end
  resources :users, only: [:show, :update]
  resources :cards, only: [:new, :create]
  resources :messages, only: [:create]
end
