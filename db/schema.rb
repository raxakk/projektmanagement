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

ActiveRecord::Schema.define(version: 20160106223232) do

  create_table "pbs", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.string   "beschreibung"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "ebene"
    t.integer  "l1"
    t.integer  "l2"
    t.integer  "l3"
    t.integer  "l4"
  end

  create_table "rbs", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.string   "qualifikation"
    t.string   "erfahrung"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "ebene"
    t.integer  "l1"
    t.integer  "l2"
  end

  create_table "wbs", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.string   "beschreibung"
    t.date     "start"
    t.date     "end"
    t.integer  "rb_id"
    t.integer  "worker_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "ebene"
    t.integer  "l1"
    t.integer  "l2"
    t.integer  "l3"
  end

  create_table "workers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
