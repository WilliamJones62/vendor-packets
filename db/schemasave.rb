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

ActiveRecord::Schema.define(version: 20180124210647) do

  create_table "packets", force: :cascade do |t|
    t.integer "user_id"
    t.integer "packet_number"
    t.integer "vendor_number"
    t.date "requested_date"
    t.date "due_date"
    t.boolean "completed"
    t.string "company_name"
    t.string "company_type"
    t.string "dba"
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.string "zip"
    t.string "state"
    t.string "cntry_code"
    t.string "ship_address_1"
    t.string "ship_address_2"
    t.string "ship_city"
    t.string "ship_zip"
    t.string "ship_state"
    t.string "primary_contact"
    t.string "phone_1"
    t.string "phone_2"
    t.string "email"
    t.string "fax"
    t.string "website"
    t.string "qa_name"
    t.string "qa_phone_1"
    t.string "qa_phone_1_ext"
    t.string "qa_phone_2"
    t.string "qa_email"
    t.string "ops_name"
    t.string "ops_phone_1"
    t.string "ops_phone_1_ext"
    t.string "ops_phone_2"
    t.string "ops_email"
    t.text "notes"
    t.string "usda_establishment_name_1"
    t.string "usda_establishment_number_1"
    t.text "mock_recall_sop_1"
    t.date "mock_recall_date_1"
    t.boolean "recall_this_year_1"
    t.string "recall_1"
    t.string "bone_foreign_1"
    t.string "complaint_1"
    t.string "problems_1"
    t.string "haccp_1_certificate"
    t.string "haccp_1_type"
    t.string "haccp_1_company"
    t.date "haccp_1_expires"
    t.date "haccp_1_scheduled"
    t.string "usda_establishment_name_2"
    t.string "usda_establishment_number_2"
    t.text "mock_recall_sop_2"
    t.date "mock_recall_date_2"
    t.boolean "recall_this_year_2"
    t.string "recall_2"
    t.text "bone_foreign_2"
    t.text "complaint_2"
    t.text "problems_2"
    t.string "haccp_2_certificate"
    t.string "haccp_2_type"
    t.string "haccp_2_company"
    t.date "haccp_2_expires"
    t.date "haccp_2_scheduled"
    t.string "usda_establishment_name_3"
    t.string "usda_establishment_number_3"
    t.text "mock_recall_sop_3"
    t.date "mock_recall_date_3"
    t.boolean "recall_this_year_3"
    t.string "recall_3"
    t.text "bone_foreign_3"
    t.text "complaint_3"
    t.text "problems_3"
    t.string "haccp_3_certificate"
    t.string "haccp_3_type"
    t.string "haccp_3_company"
    t.date "haccp_3_expires"
    t.date "haccp_3_scheduled"
    t.string "non_disclosure"
    t.string "w9"
    t.string "guarantee"
    t.string "liability"
    t.string "additional_string_1"
    t.string "additional_string_2"
    t.string "additional_string_3"
    t.string "additional_string_4"
    t.string "additional_string_5"
    t.boolean "additional_integer_1"
    t.integer "additional_integer_2"
    t.integer "additional_integer_3"
    t.integer "additional_integer_4"
    t.integer "additional_integer_5"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "haccp_1_score"
    t.string "haccp_2_score"
    t.string "haccp_3_score"
  end

  create_table "products", force: :cascade do |t|
    t.integer "packet_id"
    t.string "species"
    t.string "breed"
    t.string "product_name"
    t.string "product_code"
    t.string "vendor_code"
    t.string "vendor_name"
    t.boolean "case_piece"
    t.string "box"
    t.string "box_type"
    t.text "box_details"
    t.string "box_units"
    t.float "box_length"
    t.float "box_width"
    t.float "box_height"
    t.integer "box_count"
    t.boolean "piece_box"
    t.string "piece_pack"
    t.integer "piece_count"
    t.string "package_photo"
    t.string "label"
    t.string "label_type"
    t.string "label_details"
    t.string "safe"
    t.string "weight_units"
    t.float "weight_max"
    t.float "weight_target"
    t.float "weight_min"
    t.string "product_photo"
    t.string "bug"
    t.string "production_date"
    t.integer "pallet_layers"
    t.integer "pallet_count_per_layer"
    t.float "pallet_length"
    t.float "pallet_width"
    t.float "pallet_height"
    t.boolean "never"
    t.string "never_doc"
    t.boolean "withdrawal"
    t.string "withdrawal_doc"
    t.decimal "withdrawal_days"
    t.boolean "gmo_free"
    t.string "gmo_free_doc"
    t.boolean "organic"
    t.string "organic_doc"
    t.boolean "vaccinated"
    t.string "vaccinated_doc"
    t.integer "vaccinated_age"
    t.boolean "humane"
    t.string "humane_doc"
    t.boolean "traceable"
    t.string "traceable_doc"
    t.integer "sqft_inside"
    t.integer "sqft_outside"
    t.integer "sqft_total"
    t.string "sqft_doc"
    t.boolean "pastured"
    t.string "pastured_doc"
    t.boolean "omega3"
    t.string "omega3_doc"
    t.boolean "vegetable"
    t.string "vegetable_doc"
    t.boolean "other_claims"
    t.string "other_doc"
    t.integer "prod_to_receipt"
    t.integer "shelf_life"
    t.text "production_changes"
    t.decimal "storage_temp"
    t.string "microbe"
    t.string "physical"
    t.string "vendor_spec"
    t.string "usda_approve"
    t.string "allergens"
    t.string "additional_string_1"
    t.string "additional_string_2"
    t.string "additional_string_3"
    t.string "additional_string_4"
    t.string "additional_string_5"
    t.boolean "additional_integer_1"
    t.integer "additional_integer_2"
    t.integer "additional_integer_3"
    t.integer "additional_integer_4"
    t.integer "additional_integer_5"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
