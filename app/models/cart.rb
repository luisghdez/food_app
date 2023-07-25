class Cart < ApplicationRecord
  belongs_to :user
  has_many :mealcarts
  has_many :meals, through: :mealcarts

  def total
    mealcarts.to_a.sum { |mealcart| mealcart.total }
  end
end
