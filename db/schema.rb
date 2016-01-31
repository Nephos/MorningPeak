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

ActiveRecord::Schema.define(version: 20160131000119) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "",      null: false
    t.string   "name",                   default: "admin"
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "bills", force: :cascade do |t|
    t.integer  "client_id"
    t.string   "title",                                null: false
    t.text     "description"
    t.integer  "amount"
    t.boolean  "paid",          default: false,        null: false
    t.date     "emission_date", default: '2016-01-30', null: false
    t.date     "due_date",                             null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "bills", ["client_id"], name: "index_bills_on_client_id", using: :btree

  create_table "clients", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "url"
    t.string   "activity"
    t.text     "contact_reasons"
    t.integer  "contact_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "title",            limit: 50, default: ""
    t.text     "comment"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "creator_id"
    t.string   "creator_type"
    t.string   "role",                        default: "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id", using: :btree
  add_index "comments", ["creator_type", "creator_id"], name: "index_comments_on_creator_type_and_creator_id", using: :btree
  add_index "comments", ["role"], name: "index_comments_on_role", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.integer  "client_id"
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.text     "note"
    t.string   "region"
    t.string   "department"
    t.string   "postal_code"
    t.text     "address"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.date     "view_at"
  end

  add_index "contacts", ["client_id"], name: "index_contacts_on_client_id", using: :btree

  create_table "tickets", force: :cascade do |t|
    t.integer  "creator_id"
    t.string   "creator_type"
    t.string   "title"
    t.text     "description"
    t.string   "state",           default: "open", null: false
    t.time     "admin_view_at"
    t.time     "creator_view_at"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "tickets", ["creator_type", "creator_id"], name: "index_tickets_on_creator_type_and_creator_id", using: :btree

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "bills", "clients"
  add_foreign_key "contacts", "clients"
end
