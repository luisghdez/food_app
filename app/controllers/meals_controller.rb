class MealsController < ApplicationController
  def show
    @meal = Meal.find(params[:id])
    @category = @meal.category
  end
end
