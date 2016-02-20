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

ActiveRecord::Schema.define(version: 20160220002944) do

  create_table "complaints", force: :cascade do |t|
    t.string   "case_summary"
    t.string   "case_status"
    t.string   "case_source"
    t.datetime "case_created"
    t.datetime "case_closed"
    t.string   "first_call_resolution"
    t.string   "customer_zip_code"
    t.string   "incident_address_one"
    t.string   "incident_address_two"
    t.string   "incident_intersection_one"
    t.string   "incident_intersection_two"
    t.string   "incident_zip_code"
    t.float    "longitude"
    t.float    "latitude"
    t.string   "agency"
    t.string   "division"
    t.string   "major_area"
    t.string   "type"
    t.string   "topic"
    t.integer  "council_district",          default: 0
    t.integer  "police_district",           default: 0
    t.string   "neighborhood"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

end
