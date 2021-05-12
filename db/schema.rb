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

ActiveRecord::Schema.define(version: 2017_08_10_060014) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.index ["confirmation_token"], name: "index_admins_on_confirmation_token", unique: true
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "breeds", force: :cascade do |t|
    t.string "name"
    t.string "photo"
    t.string "description"
    t.string "temperament"
    t.string "life_span"
    t.string "height"
    t.string "weight"
  end

  create_table "dogs", force: :cascade do |t|
    t.string "name"
    t.string "age"
    t.string "breed"
    t.string "gender"
    t.boolean "adoptable"
    t.datetime "post_date"
    t.string "color"
    t.string "size"
    t.string "birth_date"
    t.string "photo"
    t.string "location"
    t.string "title_age"
    t.bigint "admin_id"
    t.index ["admin_id"], name: "index_dogs_on_admin_id"
  end

  add_foreign_key "dogs", "admins"
end
