class AddPriceToMeals < ActiveRecord::Migration[6.1]
  def change
    add_column :meals, :price, :integer
  end
end
