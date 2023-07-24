class MealsController < ApplicationController
  def show
    @meal = Meal.find(params[:id])
    @category = @meal.category
  end

  def add_to_cart
    @meal = Meal.find(params[:meal_id])
    current_user.cart.meals << @meal
    redirect_to category_meal_path(@meal.category, @meal), notice: 'Meal added to cart successfully!'
  end
end
