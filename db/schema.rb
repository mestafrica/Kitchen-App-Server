# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170506132800) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "breakfast_options", force: :cascade do |t|
    t.date     "serving_date"
    t.integer  "meal_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["meal_id"], name: "index_breakfast_options_on_meal_id", using: :btree
  end

  create_table "lunch_options", force: :cascade do |t|
    t.date     "serving_date"
    t.integer  "meal_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["meal_id"], name: "index_lunch_options_on_meal_id", using: :btree
  end

  create_table "meals", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "picture_path"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "serving_date"
    t.integer  "breakfast_id"
    t.integer  "lunch_id"
    t.integer  "supper_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["breakfast_id"], name: "index_orders_on_breakfast_id", using: :btree
    t.index ["lunch_id"], name: "index_orders_on_lunch_id", using: :btree
    t.index ["serving_date"], name: "index_orders_on_serving_date", using: :btree
    t.index ["supper_id"], name: "index_orders_on_supper_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "supper_options", force: :cascade do |t|
    t.date     "serving_date"
    t.integer  "meal_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["meal_id"], name: "index_supper_options_on_meal_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "sex"
    t.integer  "nationality"
    t.integer  "user_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "breakfast_options", "meals"
  add_foreign_key "lunch_options", "meals"
  add_foreign_key "orders", "meals", column: "breakfast_id"
  add_foreign_key "orders", "meals", column: "lunch_id"
  add_foreign_key "orders", "meals", column: "supper_id"
  add_foreign_key "supper_options", "meals"
end
