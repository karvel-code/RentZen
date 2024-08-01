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

ActiveRecord::Schema[7.0].define(version: 2024_08_01_162634) do
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

  create_table "admin_user_profiles", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "surname", null: false
    t.string "phone", null: false
    t.bigint "admin_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_user_id"], name: "index_admin_user_profiles_on_admin_user_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.index ["account_id"], name: "index_admin_users_on_account_id"
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_admin_users_on_invitation_token", unique: true
    t.index ["invited_by_id"], name: "index_admin_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_admin_users_on_invited_by"
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
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

  create_table "floors", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "apartment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["apartment_id"], name: "index_floors_on_apartment_id"
    t.index ["name"], name: "index_floors_on_name"
  end

  create_table "lease_agreements", force: :cascade do |t|
    t.bigint "unit_owner_id", null: false
    t.bigint "unit_id", null: false
    t.string "status", default: "invited", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unit_id"], name: "index_lease_agreements_on_unit_id"
    t.index ["unit_owner_id"], name: "index_lease_agreements_on_unit_owner_id"
  end

  create_table "owner_informations", force: :cascade do |t|
    t.bigint "unit_owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name", default: "", null: false
    t.string "surname", default: "", null: false
    t.string "middle_name"
    t.string "phone", default: "", null: false
    t.string "gender"
    t.string "avatar", default: "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"
    t.index ["unit_owner_id"], name: "index_owner_informations_on_unit_owner_id"
  end

  create_table "unit_owners", force: :cascade do |t|
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.index ["email"], name: "index_unit_owners_on_email", unique: true
    t.index ["invitation_token"], name: "index_unit_owners_on_invitation_token", unique: true
    t.index ["invited_by_id"], name: "index_unit_owners_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_unit_owners_on_invited_by"
    t.index ["reset_password_token"], name: "index_unit_owners_on_reset_password_token", unique: true
  end

  create_table "unit_payments", force: :cascade do |t|
    t.bigint "unit_owner_id", null: false
    t.bigint "unit_id", null: false
    t.string "status", default: "pending", null: false
    t.string "description"
    t.decimal "amount_due", null: false
    t.decimal "amount_paid", default: "0.0", null: false
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unit_id"], name: "index_unit_payments_on_unit_id"
    t.index ["unit_owner_id"], name: "index_unit_payments_on_unit_owner_id"
  end

  create_table "unit_types", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "units", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "floor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "cost", default: "0.0", null: false
    t.bigint "unit_type_id", null: false
    t.index ["floor_id"], name: "index_units_on_floor_id"
    t.index ["name"], name: "index_units_on_name"
    t.index ["unit_type_id"], name: "index_units_on_unit_type_id"
  end

  create_table "utility_payments", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "amount", null: false
    t.string "description"
    t.bigint "unit_payment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unit_payment_id"], name: "index_utility_payments_on_unit_payment_id"
  end

  add_foreign_key "admin_user_profiles", "admin_users"
  add_foreign_key "admin_users", "accounts"
  add_foreign_key "apartments", "accounts"
  add_foreign_key "floors", "apartments"
  add_foreign_key "lease_agreements", "unit_owners"
  add_foreign_key "lease_agreements", "units"
  add_foreign_key "owner_informations", "unit_owners"
  add_foreign_key "unit_payments", "unit_owners"
  add_foreign_key "unit_payments", "units"
  add_foreign_key "units", "floors"
  add_foreign_key "units", "unit_types"
  add_foreign_key "utility_payments", "unit_payments"
end
