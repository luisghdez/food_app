class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = current_user.cart
  end

  def add_meal
    @meal = Meal.find(params[:id])
    new_cart_meal = MealCart.new
    new_cart_meal.cart = current_user.cart
    new_cart_meal.meal = @meal
    new_cart_meal.quantity = 1
    if new_cart_meal.save
      flash[:message] = "Meal has been added to your cart."
      redirect_to meal_carts_path
    else
      flash[:message] = "Failed to add meal to your cart: #{meal_cart.errors.full_messages.join(', ')}"
    end
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
