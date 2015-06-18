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

ActiveRecord::Schema.define(version: 20150405021257) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.string   "status"
    t.datetime "publish_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "department_id"
    t.integer  "issue_id"
    t.text     "text",          default: "", null: false
    t.string   "slug"
  end

  add_index "articles", ["department_id"], name: "index_articles_on_department_id", using: :btree

  create_table "articles_profiles", id: false, force: :cascade do |t|
    t.integer "profile_id"
    t.integer "article_id"
  end

  add_index "articles_profiles", ["article_id"], name: "index_articles_profiles_on_article_id", using: :btree
  add_index "articles_profiles", ["profile_id"], name: "index_articles_profiles_on_profile_id", using: :btree

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.integer  "editor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "departments", ["editor_id"], name: "index_departments_on_editor_id", using: :btree

  create_table "issues", force: :cascade do |t|
    t.integer  "number"
    t.datetime "publish_date"
    t.boolean  "done",         default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "year_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "first",      default: "", null: false
    t.string   "last",       default: "", null: false
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "capabilities", default: [],              array: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", id: false, force: :cascade do |t|
    t.string   "key",        null: false
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["key"], name: "index_settings_on_key", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "profile_id"
    t.integer  "role_id"
    t.integer  "department_id"
    t.string   "encrypted_password",  default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["department_id"], name: "index_users_on_department_id", using: :btree
  add_index "users", ["profile_id"], name: "index_users_on_profile_id", using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

  create_table "years", force: :cascade do |t|
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
