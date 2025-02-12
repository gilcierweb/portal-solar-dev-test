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

ActiveRecord::Schema.define(version: 2019_10_10_083225) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "freights", force: :cascade do |t|
    t.string "state"
    t.float "weight_min"
    t.float "weight_max"
    t.float "cost"
  end

  create_table "power_generators", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "image_url"
    t.string "manufacturer"
    t.integer "structure_type"
    t.float "price"
    t.float "height"
    t.float "width"
    t.float "lenght"
    t.float "weight"
    t.float "kwp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "weigh_cubed"
  end

end
