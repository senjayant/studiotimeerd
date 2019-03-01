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

ActiveRecord::Schema.define(version: 2019_01_17_103507) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "booking_dates", force: :cascade do |t|
    t.bigint "booking_id"
    t.string "date"
    t.string "start_time"
    t.string "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_booking_dates_on_booking_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "studio_id"
    t.integer "subtotal"
    t.integer "studiotime_fee"
    t.integer "total"
    t.boolean "confirmed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["studio_id"], name: "index_bookings_on_studio_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "photo"
    t.bigint "studio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["studio_id"], name: "index_photos_on_studio_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "description"
    t.integer "rating"
    t.string "reviewer_type"
    t.bigint "reviewer_id"
    t.boolean "verified", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reviewer_type", "reviewer_id"], name: "index_reviews_on_reviewer_type_and_reviewer_id"
  end

  create_table "studio_types", force: :cascade do |t|
    t.bigint "studio_id"
    t.bigint "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["studio_id"], name: "index_studio_types_on_studio_id"
    t.index ["type_id"], name: "index_studio_types_on_type_id"
  end

  create_table "studios", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.string "country"
    t.string "city"
    t.string "latitude"
    t.string "longitude"
    t.string "price"
    t.boolean "verified", default: false
    t.boolean "premium", default: false
    t.boolean "quick_replies", default: false
    t.boolean "audio_eng_included", default: false
    t.integer "rating"
    t.text "description"
    t.integer "min_booking"
    t.text "main_equipment"
    t.text "past_clients"
    t.text "audio_samples"
    t.string "hours"
    t.text "rules"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["audio_eng_included"], name: "index_studios_on_audio_eng_included"
    t.index ["city"], name: "index_studios_on_city"
    t.index ["country"], name: "index_studios_on_country"
    t.index ["premium"], name: "index_studios_on_premium"
    t.index ["quick_replies"], name: "index_studios_on_quick_replies"
    t.index ["user_id"], name: "index_studios_on_user_id"
    t.index ["verified"], name: "index_studios_on_verified"
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_no"
    t.boolean "email_verified", default: false
    t.boolean "phone_no_verified", default: false
    t.text "description"
    t.string "response_rate"
    t.string "response_time"
    t.string "url"
    t.string "profile_pic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
