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

ActiveRecord::Schema[7.0].define(version: 2023_02_05_065258) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "unknown_flower_id", null: false
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unknown_flower_id"], name: "index_answers_on_unknown_flower_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body", null: false
    t.bigint "user_id", null: false
    t.bigint "flower_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "evaluation", null: false
    t.index ["flower_id"], name: "index_comments_on_flower_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "flower_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flower_id"], name: "index_favorites_on_flower_id"
    t.index ["user_id", "flower_id"], name: "index_favorites_on_user_id_and_flower_id", unique: true
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "flowers", force: :cascade do |t|
    t.string "name", null: false
    t.date "date", null: false
    t.integer "status", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "address", null: false
    t.string "address_detail"
    t.string "flower_image"
    t.index ["user_id"], name: "index_flowers_on_user_id"
  end

  create_table "unknown_flowers", force: :cascade do |t|
    t.string "feature", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.date "date"
    t.index ["user_id"], name: "index_unknown_flowers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "answers", "unknown_flowers"
  add_foreign_key "answers", "users"
  add_foreign_key "comments", "flowers"
  add_foreign_key "comments", "users"
  add_foreign_key "favorites", "flowers"
  add_foreign_key "favorites", "users"
  add_foreign_key "flowers", "users"
  add_foreign_key "unknown_flowers", "users"
end
