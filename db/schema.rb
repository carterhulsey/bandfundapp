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

ActiveRecord::Schema.define(version: 20140930211802) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artist_pledges", force: true do |t|
    t.integer "artist_id"
    t.integer "pledge_id"
    t.integer "price"
  end

  create_table "artists", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "about_me"
    t.integer  "genre_id"
    t.string   "name"
    t.string   "paypal_link"
    t.string   "provider"
    t.string   "uid"
    t.string   "website_url"
    t.string   "city"
    t.string   "state"
    t.integer  "pledge_id"
    t.string   "access_token"
    t.string   "stripe_publishable_key"
    t.string   "stripe_user_id"
  end

  add_index "artists", ["email"], name: "index_artists_on_email", unique: true, using: :btree
  add_index "artists", ["reset_password_token"], name: "index_artists_on_reset_password_token", unique: true, using: :btree

  create_table "fans", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pledge_id"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "fans", ["email"], name: "index_fans_on_email", unique: true, using: :btree
  add_index "fans", ["reset_password_token"], name: "index_fans_on_reset_password_token", unique: true, using: :btree

  create_table "genres", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pledges", force: true do |t|
    t.integer  "artist_id"
    t.integer  "fan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "credit_card"
    t.integer  "price"
  end

  create_table "rewards", force: true do |t|
    t.integer  "artist_id"
    t.integer  "price"
    t.string   "title"
    t.text     "description"
    t.boolean  "address_required"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
