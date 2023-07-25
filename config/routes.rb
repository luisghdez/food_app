Rails.application.routes.draw do
  devise_for :users
  root to: 'categories#index'
  resources :categories, only: [:index, :show] do
    resources :meals
  end
  resources :carts, only: [:show]
  resources :meal_carts, only: [:index]
  post 'carts/add_meal'
  post 'carts/update_meal'
  post 'carts/remove_meal'
end
