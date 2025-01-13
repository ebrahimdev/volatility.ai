# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_01_13_023617) do
  create_table "stocks", force: :cascade do |t|
    t.string "ticker"
    t.date "date"
    t.float "open"
    t.float "high"
    t.float "low"
    t.float "close"
    t.integer "volume"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date"], name: "index_stocks_on_date"
    t.index ["ticker", "date"], name: "index_stocks_on_ticker_and_date", unique: true
    t.index ["ticker"], name: "index_stocks_on_ticker"
  end
end
