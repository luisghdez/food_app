Rails.application.routes.draw do
  devise_for :users
  root to: 'categories#index'
  resources :categories, only: [:index, :show] do
    resources :meals
  end
  post '/meals/:meal_id/add_to_cart', to: 'meals#add_to_cart', as: 'add_meal_to_cart'
end
