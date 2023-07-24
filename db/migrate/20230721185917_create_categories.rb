class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :idCategory

      t.timestamps
    end
  end
end
