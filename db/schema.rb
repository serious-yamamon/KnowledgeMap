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

ActiveRecord::Schema.define(version: 2020_05_14_151358) do

  create_table "comments", force: :cascade do |t|
    t.text "comment"
    t.integer "q_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "databases", force: :cascade do |t|
    t.text "ques_s"
    t.text "answer"
    t.integer "q_id"
    t.string "list_name"
    t.integer "list_id"
    t.boolean "fav"
    t.boolean "check"
    t.boolean "correct"
    t.boolean "incorrect"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "q_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.string "image_name"
    t.integer "q_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mylists", force: :cascade do |t|
    t.integer "user_id"
    t.integer "q_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "refferences", force: :cascade do |t|
    t.integer "o_id"
    t.integer "d_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.integer "user_id"
    t.integer "q_id"
    t.boolean "correct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "name"
    t.string "pass"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
