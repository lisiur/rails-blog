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

ActiveRecord::Schema.define(version: 20160507015954) do

  create_table "admin_archives", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "author_id",  limit: 4
    t.integer  "year",       limit: 4
    t.integer  "month",      limit: 4
  end

  create_table "admin_article_types", force: :cascade do |t|
    t.string   "name",       limit: 255, default: "code"
    t.string   "img",        limit: 255
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "glyphicon",  limit: 255
  end

  create_table "admin_articles", force: :cascade do |t|
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "title",           limit: 255
    t.text     "content",         limit: 65535
    t.integer  "archive_id",      limit: 4
    t.integer  "status",          limit: 4,     default: 1
    t.integer  "article_type_id", limit: 4
    t.integer  "author_id",       limit: 4
    t.text     "abstract",        limit: 65535
    t.integer  "watch_count",     limit: 4,     default: 0
    t.integer  "editor",          limit: 4,     default: 0
  end

  create_table "admin_articles_categories", id: false, force: :cascade do |t|
    t.integer "article_id",  limit: 4
    t.integer "category_id", limit: 4
  end

  create_table "admin_articles_tags", id: false, force: :cascade do |t|
    t.integer "article_id", limit: 4
    t.integer "tag_id",     limit: 4
  end

  create_table "admin_authors", force: :cascade do |t|
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "name",            limit: 255
    t.string   "password_digest", limit: 255
    t.string   "email",           limit: 255
    t.string   "avatar",          limit: 255
  end

  create_table "admin_categories", force: :cascade do |t|
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "supcategory_id", limit: 4
    t.string   "name",           limit: 255
    t.integer  "faved",          limit: 4,   default: 0
    t.integer  "level",          limit: 4,   default: 0
    t.integer  "author_id",      limit: 4
  end

  create_table "admin_messages", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "author_id",  limit: 4
  end

  create_table "admin_tags", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "name",       limit: 255
    t.integer  "author_id",  limit: 4
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size",    limit: 4
    t.integer  "assetable_id",      limit: 4
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width",             limit: 4
    t.integer  "height",            limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "index_users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manage_users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
