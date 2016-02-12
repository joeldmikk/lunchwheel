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

ActiveRecord::Schema.define(version: 20160114173956) do

  create_table "authentications", force: :cascade do |t|
    t.string   "uid",        limit: 255
    t.string   "provider",   limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authentications", ["provider", "uid"], name: "index_authentications_on_provider_and_uid", using: :btree
  add_index "authentications", ["user_id"], name: "index_authentications_on_user_id", using: :btree

  create_table "group_memberships", force: :cascade do |t|
    t.integer  "group_id",   limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "group_memberships", ["group_id"], name: "index_group_memberships_on_group_id", using: :btree
  add_index "group_memberships", ["user_id"], name: "index_group_memberships_on_user_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.float    "latitude",   limit: 24
    t.float    "longitude",  limit: 24
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "location",   limit: 255
    t.integer  "zip_code",   limit: 4
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.integer  "price",        limit: 4
    t.integer  "distance",     limit: 4
    t.integer  "rating",       limit: 4
    t.date     "last_visited"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "latitude",     limit: 255
    t.string   "longitude",    limit: 255
    t.string   "place_id",     limit: 255
    t.string   "reference",    limit: 255
    t.string   "types",        limit: 255
    t.string   "vicinity",     limit: 255
  end

  create_table "selected_restaurants", force: :cascade do |t|
    t.integer  "group_id",      limit: 4
    t.integer  "restaurant_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "selected_restaurants", ["group_id"], name: "index_selected_restaurants_on_group_id", using: :btree
  add_index "selected_restaurants", ["restaurant_id"], name: "index_selected_restaurants_on_restaurant_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",            limit: 255, null: false
    t.string   "crypted_password", limit: 255
    t.string   "salt",             limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
