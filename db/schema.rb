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

ActiveRecord::Schema.define(version: 2019_04_27_230423) do

  create_table "accounts", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "accountable_type"
    t.integer "accountable_id"
    t.index ["accountable_type", "accountable_id"], name: "index_accounts_on_accountable_type_and_accountable_id"
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
  end

  create_table "budget_approvers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "department_id"
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity", default: 0
    t.decimal "total_expense", default: "0.0"
    t.integer "payment_manager_id"
    t.boolean "pm_approval"
    t.string "pm_reason"
    t.integer "employee_id"
    t.index ["payment_manager_id"], name: "index_carts_on_payment_manager_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.decimal "actual_funds"
    t.decimal "available_funds"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "department_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "expense_type"
    t.decimal "amount", precision: 8, scale: 2
    t.boolean "ba_approval"
    t.string "ba_reason"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "actual_expense_date"
    t.integer "department"
    t.integer "cart_id"
    t.integer "budget_approver_id"
    t.integer "employee_id"
  end

  create_table "payment_managers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "department_id"
  end

  create_table "super_accounts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taf_items", force: :cascade do |t|
    t.string "request_reason"
    t.date "expense_date"
    t.decimal "estimated_amount"
    t.string "dept"
    t.boolean "ba_approval"
    t.text "ba_reason"
    t.string "expense_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "taf_id"
    t.integer "budget_approver_id"
    t.integer "employee_id"
    t.index ["taf_id"], name: "index_taf_items_on_taf_id"
  end

  create_table "tafs", force: :cascade do |t|
    t.string "pm_reject_reason"
    t.decimal "total_estimated_amount", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "payment_manager_id"
    t.integer "quantity", default: 0
    t.boolean "pm_approval"
    t.string "pm_reason"
    t.integer "employee_id"
    t.index ["payment_manager_id"], name: "index_tafs_on_payment_manager_id"
  end

end
