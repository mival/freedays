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

ActiveRecord::Schema.define(version: 20180411094545) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "settings", force: :cascade do |t|
    t.jsonb "settings"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "password_digest"
    t.integer "role", default: 0
    t.boolean "active", default: true
    t.datetime "last_login_at"
    t.jsonb "profile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "token"
  end

  create_table "vacation_requests", force: :cascade do |t|
    t.date "start_day", null: false
    t.date "end_day", null: false
    t.boolean "accepted"
    t.bigint "user_id"
    t.bigint "vacation_type_id"
    t.index ["user_id"], name: "index_vacation_requests_on_user_id"
    t.index ["vacation_type_id"], name: "index_vacation_requests_on_vacation_type_id"
  end

  create_table "vacation_types", force: :cascade do |t|
    t.string "name"
    t.boolean "active", default: true
  end

end
