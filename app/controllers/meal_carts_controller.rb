class MealCartsController < ApplicationController
  before_action :authenticate_user!

  def index
    @order = MealCart.where(cart_id: current_user.cart.id)
  end
end