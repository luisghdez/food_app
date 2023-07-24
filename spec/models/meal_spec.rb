require 'rails_helper'
require 'spec_helper'

RSpec.describe Meal, type: :model do
  describe 'Seeds' do
    it 'should have seeded data from the API' do
      expect(Meal.count).to be >= 293
    end
  end

  describe 'Price rules and category description' do
    it 'should have correct prices' do
      # Define the category rules and their corresponding prices
      category_prices = {
        "Lamb" => 50,
        "Beef" => 45,
        "Pork" => 30
      }

      # Get all meals from the database
      meals = Meal.all

      meals.each do |meal|
        category = meal.category.strCategory

        # Check if the price for the meal is within the valid range
        expect(meal.price).to be >= 10
        expect(meal.price).to be <= 100

        # Check if the price complies with the category rules
        if category_prices.key?(category)
          expect(meal.price).to eq(category_prices[category])
        end
      end
    end
  end
end
