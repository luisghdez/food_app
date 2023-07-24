class Meal < ApplicationRecord
  belongs_to :category
  has_many :mealcarts
  has_many :carts, through: :mealcarts
end
