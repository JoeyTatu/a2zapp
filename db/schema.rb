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

ActiveRecord::Schema.define(version: 20190406131521) do

  create_table "customers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "last_active"
    t.string   "address"
    t.string   "address2"
    t.string   "city"
    t.string   "postal_code"
    t.string   "country"
    t.string   "phone"
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "customers", ["employee_id"], name: "index_customers_on_employee_id"

  create_table "departments", force: :cascade do |t|
    t.integer  "location_id"
    t.string   "department_name"
    t.text     "description"
    t.string   "department_phone"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "departments", ["location_id"], name: "index_departments_on_location_id"

  create_table "employees", force: :cascade do |t|
    t.string   "employee_type"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "started_on"
    t.date     "left_on"
    t.string   "address"
    t.string   "address2"
    t.string   "city"
    t.string   "postal_code"
    t.string   "country"
    t.string   "personal_phone"
    t.string   "office_phone"
    t.integer  "location_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "employees", ["location_id"], name: "index_employees_on_location_id"

  create_table "entries", force: :cascade do |t|
    t.string   "title"
    t.datetime "published"
    t.text     "content"
    t.text     "url"
    t.string   "author"
    t.integer  "feed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feeds", force: :cascade do |t|
    t.string   "name"
    t.text     "url"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "location_type"
    t.string   "address"
    t.string   "address2"
    t.string   "city"
    t.string   "postal_code"
    t.string   "country"
    t.string   "reception_phone"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "order_date"
    t.date     "due_on"
    t.datetime "shipped_on"
    t.string   "status"
    t.text     "comments"
    t.integer  "customer_id"
    t.integer  "product_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id"
  add_index "orders", ["product_id"], name: "index_orders_on_product_id"

  create_table "payments", force: :cascade do |t|
    t.integer  "customer_id"
    t.string   "card_type"
    t.string   "card_num"
    t.string   "transaction_ref"
    t.datetime "payment_date"
    t.decimal  "amount"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "payments", ["customer_id"], name: "index_payments_on_customer_id"

  create_table "products", force: :cascade do |t|
    t.string   "website_id"
    t.string   "barcode"
    t.string   "product_name"
    t.text     "product_desc"
    t.integer  "department_id"
    t.string   "size"
    t.decimal  "weight"
    t.string   "product_vendor"
    t.integer  "quanity_in_stock"
    t.decimal  "buy_price_each"
    t.decimal  "sell_price_each"
    t.integer  "order_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "products", ["department_id"], name: "index_products_on_department_id"
  add_index "products", ["order_id"], name: "index_products_on_order_id"

  create_table "searches", force: :cascade do |t|
    t.string   "keywords"
    t.string   "location_type"
    t.string   "address"
    t.string   "address2"
    t.string   "city"
    t.string   "postal_code"
    t.string   "country"
    t.string   "reception_phone"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "table_employees", force: :cascade do |t|
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
