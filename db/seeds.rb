# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# db/seeds.rb

# db/seeds.rb

require 'json'
require 'net/http'

# Helper method to fetch JSON data from URL
def fetch_data(url)
  uri = URI(url)
  response = Net::HTTP.get(uri)
  JSON.parse(response)
end

# Seed categories from JSON
category_url = 'https://www.themealdb.com/api/json/v1/1/categories.php'
categories_data = fetch_data(category_url)['categories']

categories_data.each do |category_data|
  Category.create!(
    idCategory: category_data['idCategory'],
    strCategory: category_data['strCategory'],
    strCategoryThumb: category_data['strCategoryThumb'],
    strCategoryDescription: category_data['strCategoryDescription']
  )
end

# Seed meals for each category from JSON
Category.all.each do |category|
  meal_url = "https://www.themealdb.com/api/json/v1/1/filter.php?c=#{category.strCategory}"
  meals_data = fetch_data(meal_url)['meals']

  meals_data.each do |meal_data|
    Meal.create!(
      idMeal: meal_data['idMeal'],
      strMeal: meal_data['strMeal'],
      strMealThumb: meal_data['strMealThumb'],
      category: category
    )
  end
end

puts "Categories created: #{Category.count}"
puts "Meals created: #{Meal.count}"
