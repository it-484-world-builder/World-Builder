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

ActiveRecord::Schema.define(version: 20190427194028) do

  create_table "campaigns", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "world_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "character_campaigns", force: :cascade do |t|
    t.integer  "character_id"
    t.integer  "campaign_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "characters", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "connections", force: :cascade do |t|
    t.integer  "parent_location_id"
    t.integer  "child_location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "gm_note"
    t.text     "player_note"
    t.integer  "world_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "npcs", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "gm_note"
    t.text     "player_note"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "image_file_path",    default: "/system/npcs/images/",          null: false
    t.string   "image_file_name",    default: "world-builder-npc-default.jpg", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.text     "name"
    t.integer  "rank"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "worlds", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "gm_note"
    t.text     "character_note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
