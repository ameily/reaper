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

ActiveRecord::Schema.define(version: 20140616030601) do

  create_table "attachments", force: true do |t|
    t.string   "customer"
    t.string   "name"
    t.text     "description"
    t.string   "category"
    t.string   "file_name"
    t.integer  "soul_id"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attachments", ["soul_id"], name: "index_attachments_on_soul_id"

  create_table "citations", force: true do |t|
    t.text     "body"
    t.integer  "soul_id"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "citations", ["soul_id"], name: "index_citations_on_soul_id"

  create_table "comments", force: true do |t|
    t.text     "body"
    t.integer  "soul_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["soul_id"], name: "index_comments_on_soul_id"

  create_table "soul_journals", force: true do |t|
    t.integer  "soul_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "soul_journals", ["soul_id"], name: "index_soul_journals_on_soul_id"

  create_table "souls", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "reap_count"
    t.integer  "rot_count"
    t.integer  "harvest_count"
    t.integer  "comment_count"
    t.string   "lang"
    t.string   "loe"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
