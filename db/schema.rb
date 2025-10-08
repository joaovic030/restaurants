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

ActiveRecord::Schema[8.0].define(version: 2025_10_08_020626) do
  create_table "menu_groups", force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menu_items", force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.decimal "price"
    t.decimal "cost"
    t.integer "menu_id", null: false
    t.integer "menu_group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_group_id"], name: "index_menu_items_on_menu_group_id"
    t.index ["menu_id"], name: "index_menu_items_on_menu_id"
  end

  create_table "menus", force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.integer "restaurant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_menus_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.text "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "menu_items", "menu_groups"
  add_foreign_key "menu_items", "menus"
  add_foreign_key "menus", "restaurants"
end
