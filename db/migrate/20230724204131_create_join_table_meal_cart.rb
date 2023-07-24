class CreateJoinTableMealCart < ActiveRecord::Migration[6.1]
  def change
    create_table :meal_carts do |t|
      t.references :meal, null: false, foreign_key: true
      t.references :cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
