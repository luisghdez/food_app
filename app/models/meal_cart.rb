class MealCart < ApplicationRecord
  belongs_to :meal
  belongs_to :cart
end
