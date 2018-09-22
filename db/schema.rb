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

ActiveRecord::Schema.define(version: 2018_09_22_035646) do

  create_table "am_entries", force: :cascade do |t|
    t.string "awesome"
    t.string "affirmation"
    t.string "words"
    t.integer "user_id"
    t.datetime "created_at", default: "2018-09-21 18:16:00", null: false
    t.datetime "updated_at", default: "2018-09-21 18:16:00", null: false
    t.string "goals1"
    t.string "goals2"
    t.string "goals3"
    t.string "gratitude1"
    t.string "gratitude2"
    t.string "gratitude3"
    t.string "gratitude4"
    t.string "gratitude5"
  end

  create_table "pm_entries", force: :cascade do |t|
    t.string "thoughts"
    t.integer "user_id"
    t.datetime "created_at", default: "2018-09-21 18:16:00", null: false
    t.datetime "updated_at", default: "2018-09-21 18:16:00", null: false
    t.string "excellent1"
    t.string "excellent2"
    t.string "lessons1"
    t.string "lessons2"
    t.string "lessons3"
    t.string "gratitude1"
    t.string "gratitude2"
    t.string "gratitude3"
    t.string "gratitude4"
    t.string "gratitude5"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
  end

end
