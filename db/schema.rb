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

ActiveRecord::Schema[7.0].define(version: 2024_01_26_054801) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "company_name", null: false
    t.string "contact_person_name", default: "", null: false
    t.string "company_email", default: "", null: false
    t.decimal "onboarding_completion_percentage"
    t.datetime "onboarding_completed_at"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "apartments", force: :cascade do |t|
    t.string "name", null: false
    t.string "location", null: false
    t.decimal "latitude"
    t.decimal "longitude"
    t.integer "no_of_floors", null: false
    t.bigint "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_apartments_on_account_id"
    t.index ["name"], name: "index_apartments_on_name"
  end

  create_table "landlords", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "surname", null: false
    t.string "phone"
    t.bigint "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_landlords_on_account_id"
  end

  add_foreign_key "apartments", "accounts"
  add_foreign_key "landlords", "accounts"
end
