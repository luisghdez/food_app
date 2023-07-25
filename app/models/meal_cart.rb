class MealCart < ApplicationRecord
  belongs_to :meal
  belongs_to :cart

  def total
    meal.price * quantity
  end
end
