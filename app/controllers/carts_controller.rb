class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = current_user.cart
  end

  def add_meal
    @meal = Meal.find(params[:meal_id])
    current_user.cart.meals << @meal
    redirect_to category_meal_path(@meal.category, @meal), notice: 'Meal added to cart successfully!'
  end

  def remove_meal
    @meal = Meal.find(params[:meal_id])
    current_user.cart.meals.delete(@meal)
    redirect_to cart_path, notice: 'Meal removed from cart successfully!'
  end
end
