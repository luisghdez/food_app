class CartsController < ApplicationController
  # before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: [:add_meal, :update_meal, :remove_meal]

  def show
    @cart = User.last.cart
  end

  def add_meal
    @meal = Meal.find(params[:id])
    new_cart_meal = MealCart.new
    new_cart_meal.cart = User.last.cart
    new_cart_meal.meal = @meal
    new_cart_meal.quantity = 1
    new_cart_meal.save
  end

  def update_meal
    @meal = Meal.find(params[:id])
    current_meal_cart = MealCart.find_by(meal_id: @meal.id)
    quantity = current_meal_cart.quantity.to_i
    if current_meal_cart && quantity > 0
      current_meal_cart.update(quantity: params[:quantity])
    elsif quantity <= 0
      current_meal_cart.destroy
    else
      MealCart.create(meal: @meal, quantity: params[:quantity])
    end
  end

  def remove_meal
    MealCart.find_by(id: params[:id]).destroy
  end
end
