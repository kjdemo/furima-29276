Rails.application.routes.draw do
  get 'items/index'
  devise_for :users
  root to: "items#index"
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy]
  
  resources :item do
    resources :purchases, only: [:index, :create,]
  end
end