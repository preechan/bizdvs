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

ActiveRecord::Schema.define(version: 20150209194509) do

  create_table "certification_categories", force: true do |t|
    t.string   "certificationCategory"
    t.string   "microDiscount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "contractor_id"
  end

  create_table "contractors", force: true do |t|
    t.string   "name"
    t.integer  "licenseNo"
    t.string   "licenseClass"
    t.string   "bondingcapacity"
    t.string   "firstname"
    t.string   "lastname"
    t.text     "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zipcode"
    t.string   "phone"
    t.string   "email"
    t.string   "trade"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "fax"
    t.string   "certificationType"
    t.string   "ownershipType"
    t.integer  "sfCertificationNumber"
    t.integer  "sfVendorNumber"
    t.integer  "firmSize"
    t.boolean  "bonding"
    t.integer  "bondingLmtSngProj"
    t.integer  "bondingLmtAgg"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
  end

  create_table "contractors_largest_public_works_projects", force: true do |t|
    t.integer  "contractor_id"
    t.integer  "largest_public_works_project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contractors_public_works_exps", force: true do |t|
    t.integer  "contractor_id"
    t.integer  "public_works_exp_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contractors_trades", force: true do |t|
    t.integer  "contractor_id"
    t.integer  "trade_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "largest_public_works_projects", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "public_works_exps", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trades", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
