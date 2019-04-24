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

ActiveRecord::Schema.define(version: 2019_04_24_193259) do

  create_table "budget_approvers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity", default: 0
    t.decimal "total_expense", default: "0.0"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.decimal "funds"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "department"
  end

  create_table "line_items", force: :cascade do |t|
    t.integer "item_id"
    t.integer "cart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_line_items_on_cart_id"
    t.index ["item_id"], name: "index_line_items_on_item_id"
  end

  create_table "payment_managers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "request_items", force: :cascade do |t|
    t.string "expense_type"
    t.decimal "amount"
    t.text "reason"
    t.boolean "ba_approval"
    t.string "ba_reason"
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
  end

  create_table "taf_line_items", force: :cascade do |t|
    t.integer "taf_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["taf_item_id"], name: "index_taf_line_items_on_taf_item_id"
  end

  create_table "tafs", force: :cascade do |t|
    t.string "pm_reject_reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "taf_line_item_id"
    t.integer "payment_manager_id"
    t.index ["payment_manager_id"], name: "index_tafs_on_payment_manager_id"
    t.index ["taf_line_item_id"], name: "index_tafs_on_taf_line_item_id"
  end

end