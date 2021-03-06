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

ActiveRecord::Schema.define(version: 20170503010707) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "meals", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "food_name",            null: false
    t.integer  "calories",             null: false
    t.integer  "quantity",             null: false
    t.string   "meal_type",            null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "original_description", null: false
    t.string   "units"
    t.index ["user_id"], name: "index_meals_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.text     "body",              null: false
    t.string   "intent"
    t.json     "json_wit_response"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "phone_number",      null: false
    t.integer  "user_id"
  end

  create_table "temp_users", force: :cascade do |t|
    t.string   "phone_number"
    t.integer  "age"
    t.integer  "weight_pounds"
    t.integer  "height_inches"
    t.integer  "target_weight_pounds"
    t.string   "sex"
    t.string   "randomized_profile_url"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "name"
    t.index ["phone_number"], name: "index_temp_users_on_phone_number", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "phone_number",           null: false
    t.integer  "age",                    null: false
    t.integer  "weight_pounds",          null: false
    t.integer  "height_inches",          null: false
    t.integer  "target_weight_pounds",   null: false
    t.string   "sex",                    null: false
    t.string   "randomized_profile_url"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "name",                   null: false
    t.integer  "maintenance_calories"
    t.string   "weight_direction"
    t.integer  "target_calories"
    t.index ["phone_number"], name: "index_users_on_phone_number", using: :btree
  end

  add_foreign_key "meals", "users"
end
