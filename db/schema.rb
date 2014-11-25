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

ActiveRecord::Schema.define(version: 20141125125330) do

  create_table "applications", force: true do |t|
    t.string   "label"
    t.string   "package_name"
    t.datetime "first_installed"
    t.string   "version_name"
    t.string   "target_sdk_version"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "collection_id"
    t.datetime "date"
  end

  create_table "audios", force: true do |t|
    t.datetime "date"
    t.integer  "collection_id"
    t.string   "album"
    t.string   "artist"
    t.string   "composer"
    t.integer  "year"
    t.datetime "date_added"
    t.datetime "date_modified"
    t.integer  "size"
    t.string   "is_alarm"
    t.string   "is_music"
    t.string   "is_notification"
    t.string   "is_podcast"
    t.string   "is_ringtone"
    t.integer  "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "collections", force: true do |t|
    t.integer  "subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "date"
  end

  create_table "demos", force: true do |t|
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "emails", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "count"
  end

  create_table "images", force: true do |t|
    t.integer  "collection_id"
    t.datetime "date"
    t.datetime "date_modified"
    t.datetime "date_added"
    t.datetime "date_taken"
    t.boolean  "is_private"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "size"
  end

  create_table "subjects", force: true do |t|
    t.datetime "date"
    t.string   "brand"
    t.string   "model"
    t.string   "device"
    t.string   "product"
    t.string   "serial"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "gender"
    t.string   "country"
    t.integer  "age"
    t.string   "version"
  end

  create_table "texts", force: true do |t|
    t.datetime "date"
    t.integer  "size"
    t.datetime "date_modified"
    t.datetime "date_added"
    t.string   "mime_type"
    t.integer  "collection_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username",            default: "", null: false
    t.string   "encrypted_password",  default: "", null: false
    t.string   "email"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true

  create_table "videos", force: true do |t|
    t.string   "tags"
    t.string   "album"
    t.string   "resolution"
    t.string   "category"
    t.integer  "duration"
    t.datetime "date_added"
    t.datetime "date_modified"
    t.datetime "date_taken"
    t.string   "description"
    t.string   "is_private"
    t.float    "longitude"
    t.float    "latitude"
    t.string   "artist"
    t.string   "language"
    t.datetime "date"
    t.integer  "collection_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "size"
  end

end
