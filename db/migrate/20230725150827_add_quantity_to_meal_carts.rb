class AddQuantityToMealCarts < ActiveRecord::Migration[6.1]
  def change
    add_column :meal_carts, :quantity, :integer
  end
end
