class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    render json: @categories
  end

  def show
    @category = Category.find(params[:id])
    @meals = @category.meals
    @cart = User.last.cart
    render json: { category: @category, meals: @meals, cart: @cart }
  end
end
