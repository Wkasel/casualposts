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

ActiveRecord::Schema.define(version: 20180418222741) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type", using: :btree
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.string   "name"
    t.integer  "subregion_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["subregion_id"], name: "index_neighborhoods_on_subregion_id", using: :btree
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.decimal  "cost"
    t.integer  "category_id"
    t.integer  "user_id"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["category_id"], name: "index_posts_on_category_id", using: :btree
    t.index ["user_id"], name: "index_posts_on_user_id", using: :btree
  end

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.string   "shortname"
    t.string   "softlink"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subregions", force: :cascade do |t|
    t.string   "name"
    t.string   "shortname"
    t.integer  "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_subregions_on_region_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        limit: 50, null: false
    t.string   "email",                      null: false
    t.string   "password_digest",            null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["username"], name: "index_users_on_username", order: { username: :desc }, using: :btree
  end

  add_foreign_key "neighborhoods", "subregions"
  add_foreign_key "subregions", "regions"
end
