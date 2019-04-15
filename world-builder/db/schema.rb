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

ActiveRecord::Schema.define(version: 20190414192201) do

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
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
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
  end

  create_table "worlds", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "gm_notes"
    t.text     "character_notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
