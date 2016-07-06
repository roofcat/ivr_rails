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

ActiveRecord::Schema.define(version: 20160706184153) do

  create_table "calls", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "collection"
    t.string   "sp"
    t.integer  "key"
    t.datetime "beginCall"
    t.integer  "origin"
    t.boolean  "callAnswered"
    t.string   "lastState"
    t.integer  "IVRSel"
    t.datetime "dialIntentBegin1"
    t.integer  "dialIntentCaller1"
    t.integer  "dialIntentCalled1"
    t.datetime "dialIntentEnd1"
    t.boolean  "dialIntentAnswered1"
    t.string   "sessionFile"
    t.string   "hc"
    t.string   "routing"
    t.string   "name"
    t.datetime "endDial"
    t.datetime "timeStamp"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "send_grid_configurations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "api_key"
    t.string   "api_user"
    t.string   "api_pass"
    t.string   "email_from"
    t.string   "email_from_name"
    t.string   "email_subject"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "template_reports", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "asunto"
    t.text     "html_template", limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.string   "name"
    t.integer  "permission_level"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
