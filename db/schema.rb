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

ActiveRecord::Schema.define(version: 20150324052204) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "match_results", force: :cascade do |t|
    t.integer  "points"
    t.integer  "scores"
    t.integer  "team_id"
    t.integer  "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "match_results", ["match_id"], name: "index_match_results_on_match_id", using: :btree
  add_index "match_results", ["team_id"], name: "index_match_results_on_team_id", using: :btree

  create_table "matches", force: :cascade do |t|
    t.integer  "round_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "matches", ["round_id"], name: "index_matches_on_round_id", using: :btree

  create_table "rounds", force: :cascade do |t|
    t.integer  "number"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.string   "status"
    t.integer  "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.integer  "score",      default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "place",      default: 0
  end

  add_foreign_key "match_results", "matches"
  add_foreign_key "match_results", "teams"
  add_foreign_key "matches", "rounds"
end
