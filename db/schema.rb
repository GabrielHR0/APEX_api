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

ActiveRecord::Schema[8.1].define(version: 2026_02_07_173701) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"
  enable_extension "pgcrypto"

  create_table "active_storage_attachments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.uuid "record_id", null: false
    t.string "record_type", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "addresses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "city"
    t.string "complement"
    t.string "country"
    t.datetime "created_at", null: false
    t.bigint "enderecavel_id", null: false
    t.string "enderecavel_type", null: false
    t.string "neighborhood"
    t.string "number"
    t.string "state"
    t.string "street"
    t.datetime "updated_at", null: false
    t.string "zip_code"
    t.index ["enderecavel_type", "enderecavel_id"], name: "index_addresses_on_enderecavel"
  end

  create_table "cards", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.boolean "active", default: true
    t.uuid "carousel_frame_id", null: false
    t.datetime "created_at", null: false
    t.text "description"
    t.integer "position"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["carousel_frame_id"], name: "index_cards_on_carousel_frame_id"
    t.index ["position"], name: "index_cards_on_position"
  end

  create_table "carousel_frames", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.text "description"
    t.integer "position"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_carousel_frames_on_active"
    t.index ["position"], name: "index_carousel_frames_on_position"
  end

  create_table "companies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.string "name"
    t.string "phone"
    t.text "tagline"
    t.datetime "updated_at", null: false
  end

  create_table "contacts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.string "ip_address"
    t.text "message"
    t.string "message_id"
    t.string "name"
    t.datetime "sent_at"
    t.string "status"
    t.datetime "updated_at", null: false
  end

  create_table "events", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.integer "position"
    t.string "subtitle"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["position"], name: "index_events_on_position"
  end

  create_table "extension_cores", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "acronym"
    t.datetime "created_at", null: false
    t.string "description"
    t.uuid "member_id", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_extension_cores_on_member_id"
  end

  create_table "hero_banners", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.text "description"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_hero_banners_on_active", where: "(active = true)"
  end

  create_table "hero_cards", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.boolean "active"
    t.datetime "created_at", null: false
    t.string "description"
    t.integer "position"
    t.string "title"
    t.datetime "updated_at", null: false
  end

  create_table "members", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.string "email"
    t.string "full_name"
    t.string "phone"
    t.string "role"
    t.datetime "updated_at", null: false
  end

  create_table "page_views", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "ip"
    t.string "page"
    t.datetime "updated_at", null: false
    t.string "user_agent"
  end

  create_table "permissions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "action", null: false
    t.datetime "created_at", null: false
    t.text "description"
    t.string "resource", null: false
    t.datetime "updated_at", null: false
    t.index ["resource", "action"], name: "index_permissions_on_resource_and_action", unique: true
  end

  create_table "projects", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.string "description"
    t.string "details"
    t.uuid "extension_core_id", null: false
    t.boolean "featured", default: false, null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["extension_core_id"], name: "index_projects_on_extension_core_id"
    t.index ["featured"], name: "index_projects_on_featured"
  end

  create_table "role_permissions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.uuid "permission_id", null: false
    t.uuid "role_id", null: false
    t.datetime "updated_at", null: false
    t.index ["permission_id"], name: "index_role_permissions_on_permission_id"
    t.index ["role_id", "permission_id"], name: "index_role_permissions_on_role_id_and_permission_id", unique: true
    t.index ["role_id"], name: "index_role_permissions_on_role_id"
  end

  create_table "roles", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.string "name", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_roles_on_name", unique: true
  end

  create_table "social_media_profiles", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.boolean "active"
    t.uuid "company_id", null: false
    t.datetime "created_at", null: false
    t.string "platform"
    t.integer "position"
    t.datetime "updated_at", null: false
    t.string "url"
    t.string "username"
    t.index ["active"], name: "index_social_media_profiles_on_active"
    t.index ["company_id"], name: "index_social_media_profiles_on_company_id"
    t.index ["position"], name: "index_social_media_profiles_on_position"
  end

  create_table "user_roles", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.uuid "role_id", null: false
    t.datetime "updated_at", null: false
    t.uuid "user_id", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_user_roles_on_user_id_and_role_id", unique: true
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "jti", null: false
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.datetime "created_at"
    t.string "event", null: false
    t.string "item_id", null: false
    t.string "item_type", null: false
    t.text "object"
    t.string "whodunnit"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cards", "carousel_frames"
  add_foreign_key "extension_cores", "members"
  add_foreign_key "projects", "extension_cores"
  add_foreign_key "role_permissions", "permissions"
  add_foreign_key "role_permissions", "roles"
  add_foreign_key "social_media_profiles", "companies"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end
