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

ActiveRecord::Schema.define(version: 20160209213432) do

  create_table "article_publications", force: :cascade do |t|
    t.integer  "articles_id",     limit: 4
    t.integer  "publications_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "article_tags", force: :cascade do |t|
    t.integer  "tags_id",     limit: 4
    t.integer  "articles_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title",      limit: 255, null: false
    t.string   "url",        limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["url"], name: "index_articles_on_url", unique: true, using: :btree

  create_table "bookmarks", force: :cascade do |t|
    t.integer  "articles_id", limit: 4,   null: false
    t.integer  "users_id",    limit: 4,   null: false
    t.string   "name",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name",         limit: 255, null: false
    t.string   "continent",    limit: 255
    t.string   "region",       limit: 255
    t.string   "crisis_level", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "countries", ["name"], name: "index_countries_on_name", unique: true, using: :btree

  create_table "country_publications", force: :cascade do |t|
    t.integer  "countries_id",    limit: 4
    t.integer  "publications_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publications", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.string   "language",   limit: 255
    t.string   "bias",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publications", ["name"], name: "index_publications_on_name", unique: true, using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
