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

ActiveRecord::Schema.define(version: 20180502131428) do

  create_table "carparts", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.string   "description"
    t.text     "details"
    t.float    "price"
    t.integer  "stock"
    t.integer  "reserved"
    t.datetime "reservedtime"
    t.datetime "paidtime"
    t.integer  "sold"
    t.integer  "company_id"
    t.integer  "car_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "carparts", ["car_id"], name: "index_carparts_on_car_id"
  add_index "carparts", ["company_id"], name: "index_carparts_on_company_id"
  add_index "carparts", ["user_id"], name: "index_carparts_on_user_id"

  create_table "cars", force: :cascade do |t|
    t.string   "make",           null: false
    t.string   "model",          null: false
    t.string   "makeyear"
    t.string   "body"
    t.string   "version"
    t.string   "classification"
    t.string   "bodytype"
    t.integer  "door"
    t.integer  "seat"
    t.string   "engineplace"
    t.string   "drivetrain"
    t.integer  "company_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "cars", ["company_id"], name: "index_cars_on_company_id"

  create_table "companies", force: :cascade do |t|
    t.string   "name",                     null: false
    t.text     "description"
    t.string   "contactname"
    t.string   "street"
    t.string   "city"
    t.string   "postcode"
    t.string   "country"
    t.string   "phone",                    null: false
    t.string   "email",       default: "", null: false
    t.string   "homepage"
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "carpart_id"
  end

  add_index "companies", ["carpart_id"], name: "index_companies_on_carpart_id"
  add_index "companies", ["name", "email"], name: "index_companies_on_name_and_email", unique: true
  add_index "companies", ["user_id"], name: "index_companies_on_user_id"

  create_table "logos", force: :cascade do |t|
    t.string   "filename"
    t.string   "content_type"
    t.binary   "file_contents"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "company_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "logos", ["company_id"], name: "index_logos_on_company_id"
  add_index "logos", ["user_id"], name: "index_logos_on_user_id"

  create_table "photos", force: :cascade do |t|
    t.string   "filename"
    t.string   "content_type"
    t.binary   "file_contents"
    t.string   "description"
    t.integer  "car_id"
    t.integer  "bike_id"
    t.integer  "carpart_id"
    t.integer  "bikepart_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "photos", ["bike_id"], name: "index_photos_on_bike_id"
  add_index "photos", ["bikepart_id"], name: "index_photos_on_bikepart_id"
  add_index "photos", ["car_id"], name: "index_photos_on_car_id"
  add_index "photos", ["carpart_id"], name: "index_photos_on_carpart_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.integer  "role",                   default: 0
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
