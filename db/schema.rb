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

ActiveRecord::Schema.define(version: 2022_05_31_100622) do

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
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "spot_id", null: false
    t.text "content"
    t.integer "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["spot_id"], name: "index_comments_on_spot_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "spot_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["spot_id"], name: "index_favorites_on_spot_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "comment_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["comment_id"], name: "index_likes_on_comment_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable"
  end

  create_table "services", force: :cascade do |t|
    t.bigint "spot_id", null: false
    t.boolean "parking", default: false
    t.boolean "restaurant", default: false
    t.boolean "shower", default: false
    t.boolean "camping", default: false
    t.boolean "beach_surveillance", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["spot_id"], name: "index_services_on_spot_id"
  end

  create_table "spot_activities", force: :cascade do |t|
    t.bigint "spot_id", null: false
    t.bigint "activity_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activity_id"], name: "index_spot_activities_on_activity_id"
    t.index ["spot_id"], name: "index_spot_activities_on_spot_id"
  end

  create_table "spots", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "full_name"
    t.string "address"
    t.float "longitude"
    t.float "latitude"
    t.text "description"
    t.string "spot_type"
    t.string "icon"
    t.string "category"
    t.integer "verification_count", default: 0
    t.boolean "verified", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_spots_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "last_name"
    t.string "first_name"
    t.string "nick_name"
    t.string "address"
    t.date "birthday"
    t.string "gender"
    t.integer "profile_exp"
    t.string "status"
    t.string "favorite_area"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "weathers", force: :cascade do |t|
    t.bigint "spot_id", null: false
    t.string "weather"
    t.integer "wind_direction"
    t.integer "wind"
    t.integer "gust"
    t.integer "tmin"
    t.integer "tmax"
    t.integer "probarain"
    t.integer "uv"
    t.datetime "datetime"
    t.integer "high_tide"
    t.integer "low_tide"
    t.integer "day"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["spot_id"], name: "index_weathers_on_spot_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "spots"
  add_foreign_key "comments", "users"
  add_foreign_key "favorites", "spots"
  add_foreign_key "favorites", "users"
  add_foreign_key "likes", "comments"
  add_foreign_key "likes", "users"
  add_foreign_key "services", "spots"
  add_foreign_key "spot_activities", "activities"
  add_foreign_key "spot_activities", "spots"
  add_foreign_key "spots", "users"
  add_foreign_key "weathers", "spots"
end
