# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_211_017_184_125) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'addresses', force: :cascade do |t|
    t.bigint 'customer_id', null: false
    t.string 'postal_code'
    t.string 'street'
    t.integer 'number'
    t.string 'complement'
    t.string 'neighborhood'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['customer_id'], name: 'index_addresses_on_customer_id'
  end

  create_table 'customers', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.date 'birth_date'
    t.string 'gender'
    t.string 'document'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'email'
    t.index ['document'], name: 'index_customers_on_document', unique: true
  end

  create_table 'orders', force: :cascade do |t|
    t.bigint 'plan_id', null: false
    t.bigint 'customer_id', null: false
    t.bigint 'smartphone_id', null: false
    t.string 'imei'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['customer_id'], name: 'index_orders_on_customer_id'
    t.index ['plan_id'], name: 'index_orders_on_plan_id'
    t.index ['smartphone_id'], name: 'index_orders_on_smartphone_id'
  end

  create_table 'phones', force: :cascade do |t|
    t.bigint 'customer_id', null: false
    t.string 'number'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['customer_id'], name: 'index_phones_on_customer_id'
  end

  create_table 'plans', force: :cascade do |t|
    t.string 'name'
    t.decimal 'value'
    t.string 'description'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'smartphones', force: :cascade do |t|
    t.string 'model'
    t.string 'manufacturer'
    t.date 'release'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  add_foreign_key 'addresses', 'customers'
  add_foreign_key 'orders', 'customers'
  add_foreign_key 'orders', 'plans'
  add_foreign_key 'orders', 'smartphones'
  add_foreign_key 'phones', 'customers'
end
