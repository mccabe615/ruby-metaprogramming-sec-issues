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

ActiveRecord::Schema.define(version: 20141024001958) do

  create_table "articles", force: true do |t|
    t.string   "name"
    t.string   "body"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attachments", force: true do |t|
    t.string   "name"
    t.string   "filetype"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", force: true do |t|
    t.string   "name"
    t.integer  "salary"
    t.string   "status"
    t.string   "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
  end

  create_table "reports", force: true do |t|
    t.string   "name"
    t.string   "body"
    t.string   "filetype"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "ssn"
    t.string   "email"
    t.string   "standing"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
