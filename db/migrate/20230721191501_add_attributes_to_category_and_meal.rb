class AddAttributesToCategoryAndMeal < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :strCategory, :string
    add_column :categories, :strCategoryThumb, :string
    add_column :categories, :strCategoryDescription, :text

    # Add new attributes to the Meal model
    add_column :meals, :strMeal, :string
    add_column :meals, :strMealThumb, :string
  end
end
