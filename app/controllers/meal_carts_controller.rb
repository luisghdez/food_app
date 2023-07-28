class MealCartsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @order = MealCart.where(cart_id: User.last.cart.id)
    @total = 0
    @order.each { |o| @total += o.meal.price * o.quantity }

    @order_with_meals = @order.map do |o|
      {
        id: o.id,
        quantity: o.quantity,
        meal: {
          id: o.meal.id,
          strMeal: o.meal.strMeal,
          price: o.meal.price
        }
      }
    end

    render json: { order: @order_with_meals, total: @total }
  end

end
