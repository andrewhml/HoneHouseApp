# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140324200610) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: true do |t|
    t.text     "title"
    t.text     "subtitle"
    t.text     "sport"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "url"
    t.text     "description"
    t.string   "course_image_file_name"
    t.string   "course_image_content_type"
    t.integer  "course_image_file_size"
    t.datetime "course_image_updated_at"
  end

  create_table "lessons", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "unit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lessons", ["unit_id"], name: "index_lessons_on_unit_id", using: :btree

  create_table "memberships", force: true do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.text     "role",       default: "student"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "memberships", ["course_id"], name: "index_memberships_on_course_id", using: :btree
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id", using: :btree

  create_table "resources", force: true do |t|
    t.text     "title"
    t.text     "url"
    t.integer  "lesson_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "resources", ["lesson_id"], name: "index_resources_on_lesson_id", using: :btree

  create_table "reviews", force: true do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["course_id"], name: "index_reviews_on_course_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "units", force: true do |t|
    t.integer  "unit_number"
    t.string   "title"
    t.text     "description"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "units", ["course_id"], name: "index_units_on_course_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                      default: "",        null: false
    t.string   "encrypted_password",         default: "",        null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.text     "headline"
    t.string   "zip"
    t.string   "role",                       default: "general"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",              default: 0,         null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "profile_image_file_name"
    t.string   "profile_image_content_type"
    t.integer  "profile_image_file_size"
    t.datetime "profile_image_updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "videos", force: true do |t|
    t.string   "url"
    t.integer  "lesson_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "videos", ["lesson_id"], name: "index_videos_on_lesson_id", using: :btree

end
