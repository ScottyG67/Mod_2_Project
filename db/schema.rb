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

ActiveRecord::Schema.define(version: 2021_02_16_205435) do

  create_table "caterers", force: :cascade do |t|
    t.string "name"
    t.string "food_type"
    t.float "cost_per_head"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "time"
    t.integer "durations_hours"
    t.integer "venue_id", null: false
    t.integer "caterer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["caterer_id"], name: "index_events_on_caterer_id"
    t.index ["venue_id"], name: "index_events_on_venue_id"
  end

  create_table "user_events", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "event_id", null: false
    t.boolean "organizer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_user_events_on_event_id"
    t.index ["user_id"], name: "index_user_events_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.text "bio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "venue_caterers", force: :cascade do |t|
    t.integer "venue_id", null: false
    t.integer "caterer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["caterer_id"], name: "index_venue_caterers_on_caterer_id"
    t.index ["venue_id"], name: "index_venue_caterers_on_venue_id"
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "location"
    t.integer "capacity"
    t.float "cost"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "events", "caterers"
  add_foreign_key "events", "venues"
  add_foreign_key "user_events", "events"
  add_foreign_key "user_events", "users"
  add_foreign_key "venue_caterers", "caterers"
  add_foreign_key "venue_caterers", "venues"
end
