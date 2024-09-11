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

ActiveRecord::Schema[7.2].define(version: 2024_09_11_143055) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "line_1"
    t.string "line_2"
    t.string "postal_code"
    t.string "phone_number"
    t.integer "address_type"
    t.boolean "is_default", default: false
    t.bigint "city_id", null: false
    t.bigint "district_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_addresses_on_city_id"
    t.index ["district_id"], name: "index_addresses_on_district_id"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "attributes", force: :cascade do |t|
    t.string "name"
    t.jsonb "values"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "discount_coupons", force: :cascade do |t|
    t.string "code", null: false
    t.text "description"
    t.decimal "discount_amount", precision: 10, scale: 2
    t.decimal "discount_percentage", precision: 5, scale: 2
    t.datetime "start_date", null: false
    t.datetime "end_date", null: false
    t.jsonb "applicable_categories", default: []
    t.jsonb "applicable_stores", default: []
    t.jsonb "applicable_products", default: []
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "districts", force: :cascade do |t|
    t.string "name"
    t.bigint "city_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_districts_on_city_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_favorites_on_product_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "last_viewed", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_last_viewed_on_product_id"
    t.index ["user_id"], name: "index_last_viewed_on_user_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "product_id", null: false
    t.integer "quantity"
    t.decimal "price", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.decimal "total_amount", precision: 10, scale: 2
    t.string "status"
    t.datetime "shipped_at"
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "product_attributes", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "attribute_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attribute_id"], name: "index_product_attributes_on_attribute_id"
    t.index ["product_id"], name: "index_product_attributes_on_product_id"
  end

  create_table "product_inquiries", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "store_id", null: false
    t.bigint "product_id", null: false
    t.text "question"
    t.text "response"
    t.boolean "is_responded", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_inquiries_on_product_id"
    t.index ["store_id"], name: "index_product_inquiries_on_store_id"
    t.index ["user_id"], name: "index_product_inquiries_on_user_id"
  end

  create_table "product_reviews", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "product_id", null: false
    t.integer "rating"
    t.text "review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_reviews_on_product_id"
    t.index ["user_id"], name: "index_product_reviews_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "subcategory_id", null: false
    t.bigint "brand_id", null: false
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_products_on_brand_id"
    t.index ["subcategory_id"], name: "index_products_on_subcategory_id"
  end

  create_table "shopping_cart", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_shopping_cart_on_product_id"
    t.index ["user_id"], name: "index_shopping_cart_on_user_id"
  end

  create_table "store_follows", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "store_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_store_follows_on_store_id"
    t.index ["user_id"], name: "index_store_follows_on_user_id"
  end

  create_table "store_products", force: :cascade do |t|
    t.bigint "store_id", null: false
    t.bigint "product_id", null: false
    t.integer "stock", default: 0
    t.decimal "price", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_store_products_on_product_id"
    t.index ["store_id"], name: "index_store_products_on_store_id"
  end

  create_table "store_reviews", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "store_id", null: false
    t.integer "rating"
    t.text "review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_store_reviews_on_store_id"
    t.index ["user_id"], name: "index_store_reviews_on_user_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "contact_mail"
    t.string "contact_phone"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subcategories", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_subcategories_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name_surname"
    t.string "email", null: false
    t.string "gsm"
    t.string "password_digest"
    t.integer "gender"
    t.date "date_of_birth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addresses", "cities"
  add_foreign_key "addresses", "districts"
  add_foreign_key "addresses", "users"
  add_foreign_key "districts", "cities"
  add_foreign_key "favorites", "products"
  add_foreign_key "favorites", "users"
  add_foreign_key "last_viewed", "products"
  add_foreign_key "last_viewed", "users"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "users"
  add_foreign_key "product_attributes", "attributes"
  add_foreign_key "product_attributes", "products"
  add_foreign_key "product_inquiries", "products"
  add_foreign_key "product_inquiries", "stores"
  add_foreign_key "product_inquiries", "users"
  add_foreign_key "product_reviews", "products"
  add_foreign_key "product_reviews", "users"
  add_foreign_key "products", "brands"
  add_foreign_key "products", "subcategories"
  add_foreign_key "shopping_cart", "products"
  add_foreign_key "shopping_cart", "users"
  add_foreign_key "store_follows", "stores"
  add_foreign_key "store_follows", "users"
  add_foreign_key "store_products", "products"
  add_foreign_key "store_products", "stores"
  add_foreign_key "store_reviews", "stores"
  add_foreign_key "store_reviews", "users"
  add_foreign_key "subcategories", "categories"
end
