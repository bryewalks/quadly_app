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

ActiveRecord::Schema.define(version: 2019_03_20_030701) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drones", force: :cascade do |t|
    t.string "name"
    t.text "notes"
    t.boolean "favorite", default: false
    t.integer "status"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "location_reviews", force: :cascade do |t|
    t.text "summary"
    t.text "warning"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.integer "flight_zone_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "airport", default: false
  end

  create_table "user_locations", force: :cascade do |t|
    t.integer "location_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weathers", force: :cascade do |t|
    t.boolean "good_to_fly", default: false
    t.integer "wind_speed"
    t.integer "temperature"
    t.integer "visibility_miles"
    t.integer "max_gust_speed"
    t.integer "chance_of_precipitation"
    t.integer "cloud_cover"
    t.integer "wind_direction"
    t.integer "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
