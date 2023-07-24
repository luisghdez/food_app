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
    if new_cart_meal.save
      flash[:message] = "Meal has been added to your cart."
      redirect_to root_path
    else
      flash[:message] = "Failed to add meal to your cart: #{meal_cart.errors.full_messages.join(', ')}"
    end
  end

  def remove_meal
    @meal = Meal.find(params[:meal_id])
    current_user.cart.meals.delete(@meal)
    redirect_to cart_path, notice: 'Meal removed from cart successfully!'
  end
end
