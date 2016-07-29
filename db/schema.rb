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

ActiveRecord::Schema.define(version: 20160624234050) do

  create_table "nrp_applications", force: :cascade do |t|
    t.string   "user_name",  limit: 255
    t.string   "email",      limit: 255
    t.string   "age",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "recruit_applications", force: :cascade do |t|
    t.string   "age",                limit: 3
    t.string   "email",              limit: 100
    t.string   "user_name",          limit: 40
    t.boolean  "has_ts3"
    t.boolean  "has_mic"
    t.string   "steam_link",         limit: 255
    t.string   "country",            limit: 255
    t.string   "new_experience",     limit: 255
    t.integer  "which_company",      limit: 4
    t.text     "join_reason",        limit: 65535
    t.string   "vouch",              limit: 255
    t.boolean  "accept_code"
    t.integer  "application_status", limit: 4,     default: 1
    t.string   "processed_by",       limit: 255,   default: ""
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "recruit_applications", ["user_name"], name: "index_recruit_applications_on_user_name", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "user_name",       limit: 32,                  null: false
    t.string   "email",           limit: 100, default: "",    null: false
    t.boolean  "admin",                       default: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "password_digest", limit: 255
  end

  add_index "users", ["user_name"], name: "index_users_on_user_name", using: :btree

end
