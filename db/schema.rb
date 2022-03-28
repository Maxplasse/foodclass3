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

ActiveRecord::Schema.define(version: 2022_03_28_160537) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chefs", force: :cascade do |t|
    t.string "restaurant_name"
    t.string "specialty"
    t.string "level"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_chefs_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.bigint "course_id", null: false
    t.bigint "participation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_comments_on_course_id"
    t.index ["participation_id"], name: "index_comments_on_participation_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.string "difficulty"
    t.string "category"
    t.integer "duration"
    t.integer "participants_total"
    t.integer "level_points"
    t.datetime "start_at"
    t.datetime "end_at"
    t.bigint "chef_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chef_id"], name: "index_courses_on_chef_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "course_id", null: false
    t.bigint "participation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_messages_on_course_id"
    t.index ["participation_id"], name: "index_messages_on_participation_id"
  end

  create_table "participations", force: :cascade do |t|
    t.boolean "favorite"
    t.bigint "user_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_participations_on_course_id"
    t.index ["user_id"], name: "index_participations_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.text "content"
    t.bigint "participation_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_posts_on_course_id"
    t.index ["participation_id"], name: "index_posts_on_participation_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "nickname"
    t.string "level", default: "apprenti"
    t.string "photo"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "chefs", "users"
  add_foreign_key "comments", "courses"
  add_foreign_key "comments", "participations"
  add_foreign_key "courses", "chefs"
  add_foreign_key "messages", "courses"
  add_foreign_key "messages", "participations"
  add_foreign_key "participations", "courses"
  add_foreign_key "participations", "users"
  add_foreign_key "posts", "courses"
  add_foreign_key "posts", "participations"
end
