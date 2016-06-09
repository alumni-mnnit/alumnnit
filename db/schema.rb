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

ActiveRecord::Schema.define(version: 20160605032835) do

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "phn_no"
    t.string   "email"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "convention_requests", force: :cascade do |t|
    t.boolean  "status",        default: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "user_id"
    t.integer  "convention_id"
  end

  add_index "convention_requests", ["convention_id"], name: "index_convention_requests_on_convention_id"
  add_index "convention_requests", ["user_id"], name: "index_convention_requests_on_user_id"

  create_table "conventions", force: :cascade do |t|
    t.date     "year"
    t.date     "start_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.text     "feedback"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "feedbacks", ["user_id"], name: "index_feedbacks_on_user_id"

  create_table "id_card_counts", force: :cascade do |t|
    t.integer  "batch"
    t.integer  "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "id_card_requests", force: :cascade do |t|
    t.integer  "user_id"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "id_card_requests", ["user_id"], name: "index_id_card_requests_on_user_id"

  create_table "id_cards", force: :cascade do |t|
    t.string   "id_number"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "id_card_request_id"
  end

  add_index "id_cards", ["id_card_request_id"], name: "index_id_cards_on_id_card_request_id"

  create_table "requests", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "user_id"
  end

  add_index "requests", ["user_id"], name: "index_requests_on_user_id"

  create_table "searches", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "email"
    t.string   "degree"
    t.string   "branch"
    t.string   "year_of_passing"
    t.string   "city"
    t.string   "company"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.boolean  "is_admin",               default: false
    t.boolean  "is_active",              default: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "fname"
    t.string   "lname"
    t.string   "nick_name"
    t.string   "gender"
    t.string   "reg_no"
    t.float    "phn_no"
    t.date     "date_of_birth"
    t.string   "degree"
    t.string   "branch"
    t.date     "year_of_passing"
    t.text     "curr_address"
    t.float    "pincode"
    t.string   "h_town"
    t.string   "city"
    t.string   "country",                default: "India"
    t.string   "company"
    t.string   "designation"
    t.text     "achievements"
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
