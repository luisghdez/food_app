# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_07_24_182031) do

  create_table "categories", force: :cascade do |t|
    t.string "idCategory"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "strCategory"
    t.string "strCategoryThumb"
    t.text "strCategoryDescription"
  end

  create_table "meals", force: :cascade do |t|
    t.string "idMeal"
    t.integer "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "strMeal"
    t.string "strMealThumb"
    t.integer "price"
    t.index ["category_id"], name: "index_meals_on_category_id"
  end

  add_foreign_key "meals", "categories"
end
