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

ActiveRecord::Schema.define(version: 20160930111836) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "logo"
    t.string   "motto"
    t.string   "founded"
    t.integer  "seeking"
    t.integer  "raised"
    t.string   "tag"
    t.string   "industry"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "no_of_employees"
    t.string   "no_of_founders"
    t.string   "fundraising_amount"
    t.string   "company_website"
    t.text     "description"
    t.text     "readiness"
    t.text     "projections"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "linkedin"
    t.string   "angellist"
    t.string   "growth_projections"
    t.string   "geography"
    t.string   "product_stage"
    t.text     "vision"
    t.text     "problem"
    t.text     "solution"
    t.text     "impact"
    t.string   "document"
    t.string   "background_image"
    t.string   "country"
    t.string   "city"
    t.integer  "creator_id"
  end

  create_table "company_documents", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "document"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "company_photos", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "photo"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "company_image_file_name"
    t.string   "company_image_content_type"
    t.integer  "company_image_file_size"
    t.datetime "company_image_updated_at"
  end

  create_table "education_schools", force: :cascade do |t|
    t.string   "area_of_study"
    t.string   "degree"
    t.string   "school"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "educations", force: :cascade do |t|
    t.string   "level"
    t.string   "area_of_study"
    t.string   "school"
    t.integer  "passing_year"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
  end

  create_table "faqs", force: :cascade do |t|
    t.string   "question"
    t.text     "answer"
    t.text     "content"
    t.string   "tags"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "highlights", force: :cascade do |t|
    t.string   "hightlight_type"
    t.string   "highlight_title"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "investment_documents", force: :cascade do |t|
    t.integer  "investment_id"
    t.string   "document"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "investment_documents", ["investment_id"], name: "index_investment_documents_on_investment_id", using: :btree

  create_table "investment_photos", force: :cascade do |t|
    t.integer  "investment_id"
    t.string   "photo"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "investment_image_file_name"
    t.string   "investment_image_content_type"
    t.integer  "investment_image_file_size"
    t.datetime "investment_image_updated_at"
  end

  add_index "investment_photos", ["investment_id"], name: "index_investment_photos_on_investment_id", using: :btree

  create_table "investment_videos", force: :cascade do |t|
    t.integer  "investment_id"
    t.string   "title"
    t.text     "link"
    t.text     "description"
    t.text     "tags"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "investment_videos", ["investment_id"], name: "index_investment_videos_on_investment_id", using: :btree

  create_table "investments", force: :cascade do |t|
    t.string   "title"
    t.integer  "size"
    t.text     "description"
    t.integer  "type"
    t.integer  "revenue_share"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "company_id"
    t.string   "industry"
    t.string   "stage"
    t.string   "location"
    t.integer  "expected_return"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "document"
    t.string   "highlights_1"
    t.string   "highlights_2"
    t.string   "highlights_3"
    t.string   "highlights_4"
    t.string   "highlights_5"
    t.string   "highlights_6"
    t.string   "highlights_7"
    t.string   "highlights_8"
    t.string   "highlights_9"
    t.string   "highlights_10"
    t.text     "overview_1"
    t.text     "overview_2"
    t.text     "overview_3"
    t.string   "problem_bullet_1"
    t.string   "problem_bullet_2"
    t.string   "problem_bullet_3"
    t.string   "problem_bullet_4"
    t.string   "problem_bullet_5"
    t.string   "solution_bullet_1"
    t.string   "solution_bullet_2"
    t.string   "solution_bullet_3"
    t.string   "solution_bullet_4"
    t.string   "solution_bullet_5"
    t.string   "founder_name_1"
    t.string   "founder_role_1"
    t.text     "founder_bio_1"
    t.string   "founder_name_2"
    t.string   "founder_role_2"
    t.text     "founder_bio_2"
    t.string   "founder_name_3"
    t.string   "founder_role_3"
    t.text     "founder_bio_3"
    t.string   "founder_name_4"
    t.string   "founder_role_4"
    t.text     "founder_bio_4"
    t.string   "advisor_name_1"
    t.string   "advisor_role_1"
    t.text     "advisor_bio_1"
    t.string   "advisor_name_2"
    t.string   "advisor_role_2"
    t.text     "advisor_bio_2"
    t.integer  "investor_id"
    t.string   "background_image"
    t.string   "logo"
  end

  add_index "investments", ["investor_id"], name: "index_investments_on_investor_id", using: :btree

  create_table "legal_notices", force: :cascade do |t|
    t.text     "company_notice"
    t.text     "investment_notice"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "legals", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "tags"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "company_id"
    t.integer  "investment_id"
  end

  create_table "notes", force: :cascade do |t|
    t.text     "content"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "past_investments", force: :cascade do |t|
    t.string   "name"
    t.string   "company"
    t.string   "product"
    t.string   "funding_stage"
    t.integer  "year"
    t.boolean  "still_holding",     default: false
    t.boolean  "boolean",           default: false
    t.boolean  "impact_investment", default: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "user_id"
    t.string   "industry"
  end

  create_table "questionnaires", force: :cascade do |t|
    t.integer  "company_founder_1"
    t.integer  "company_founder_2"
    t.integer  "company_founder_3"
    t.integer  "company_founder_4"
    t.string   "company_name"
    t.string   "company_website"
    t.string   "year_founded"
    t.text     "elevator_pitch"
    t.text     "interesting_why"
    t.text     "motivation"
    t.string   "product_stage"
    t.string   "financial_stage"
    t.string   "burn_rate"
    t.string   "revenue"
    t.string   "current_month_revenue"
    t.string   "ebitda_estimate"
    t.text     "risks_overview"
    t.text     "core_competency"
    t.text     "greatest_challenge"
    t.text     "opportunity"
    t.text     "critical_cost"
    t.text     "worst_case_scenario"
    t.string   "customers"
    t.text     "customers_overview"
    t.text     "customer_location"
    t.text     "customer_consumption"
    t.text     "customer_motivation"
    t.string   "customer_drivers"
    t.string   "distribution_power"
    t.string   "supply_power"
    t.text     "pricing_strategy"
    t.text     "company_evolution"
    t.text     "cofounder_story"
    t.text     "skills_mix_1"
    t.text     "skills_mix_2"
    t.string   "management_team_status"
    t.string   "management_team_filled_roles"
    t.string   "management_city_location"
    t.string   "past_experience_relevancy"
    t.string   "time_investment"
    t.string   "full_time_employees"
    t.string   "early_stage_experience"
    t.string   "location_relevancy"
    t.string   "contributed_capital"
    t.string   "management_earnings"
    t.text     "alternative_interest"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.integer  "user_id"
    t.integer  "status",                             default: 0
    t.string   "first_name"
    t.string   "family_name"
    t.string   "email"
    t.string   "founder"
    t.string   "company_business_type"
    t.text     "product_service"
    t.string   "distribution_channel"
    t.string   "management_spending"
    t.string   "management_team_relationship"
    t.string   "management_team_invest"
    t.text     "not_working_with_business"
    t.text     "management_passionate"
    t.string   "key_strengths"
    t.string   "improvement_strength"
    t.string   "company_industry"
    t.text     "primarily_operate_country"
    t.string   "market_acceptance"
    t.text     "customers_experiment"
    t.string   "market_size"
    t.string   "market_size_in_5_year"
    t.string   "determine_numbers"
    t.string   "business_projection_within_5_years"
    t.text     "customer_base_grow"
    t.string   "competitive_position"
    t.string   "product_substitutes"
    t.text     "market_barrier"
    t.string   "customer_identification"
    t.text     "fund_description"
    t.string   "participate"
    t.string   "finance_type"
    t.text     "fund_estimate"
    t.date     "fund_close_estimate"
    t.string   "fund_time_period"
    t.text     "fund_change_plan"
    t.text     "hear_about_us_by"
    t.string   "management_linkedin_url"
    t.string   "linkedin_url"
    t.string   "suggestion"
    t.integer  "company_id"
    t.string   "fund_plan"
  end

  create_table "report_authors", force: :cascade do |t|
    t.integer  "report_id"
    t.integer  "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "report_authors", ["author_id"], name: "index_report_authors_on_author_id", using: :btree
  add_index "report_authors", ["report_id"], name: "index_report_authors_on_report_id", using: :btree

  create_table "report_categories", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "reports", force: :cascade do |t|
    t.string   "title"
    t.integer  "report_category_id"
    t.integer  "created_by_id"
    t.integer  "last_updated_by_id"
    t.string   "document"
    t.datetime "published_at"
    t.integer  "status",             default: 0
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.text     "description"
    t.integer  "company_id"
    t.integer  "investment_id"
  end

  add_index "reports", ["created_by_id"], name: "index_reports_on_created_by_id", using: :btree
  add_index "reports", ["last_updated_by_id"], name: "index_reports_on_last_updated_by_id", using: :btree
  add_index "reports", ["report_category_id"], name: "index_reports_on_report_category_id", using: :btree

  create_table "staffs", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "role"
    t.integer  "investment_id"
  end

  add_index "staffs", ["company_id", "user_id"], name: "index_staffs_on_company_id_and_user_id", using: :btree

  create_table "term_sheets", force: :cascade do |t|
    t.integer  "investment_id"
    t.string   "description"
    t.string   "security"
    t.string   "automatic_conversion"
    t.float    "interest_rate"
    t.string   "interest_payments"
    t.date     "maturity_date"
    t.float    "conversion_discount"
    t.integer  "conversion_cap"
    t.string   "optional_conversion"
    t.string   "redemption_option"
    t.integer  "min_investment_for_vestedAngels"
    t.integer  "min_Raise_through_vestedAngels"
    t.integer  "max_raise_through_vestedAngels"
    t.float    "maximum_fund_investors"
    t.integer  "management_fee"
    t.integer  "carried_interest"
    t.string   "administrative_cost"
    t.date     "target_closing_date"
    t.string   "other"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "terms", force: :cascade do |t|
    t.string   "investment_interested"
    t.string   "investment_experience"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "updates", force: :cascade do |t|
    t.string   "title"
    t.text     "brief_description"
    t.text     "detailed_description"
    t.integer  "updateable_id"
    t.string   "updateable_type"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "updates", ["updateable_type", "updateable_id"], name: "index_updates_on_updateable_type_and_updateable_id", using: :btree

  create_table "user_documents", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "document"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_documents", ["user_id"], name: "index_user_documents_on_user_id", using: :btree

  create_table "user_photos", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "photo"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "user_image_file_name"
    t.string   "user_image_content_type"
    t.integer  "user_image_file_size"
    t.datetime "user_image_updated_at"
  end

  add_index "user_photos", ["user_id"], name: "index_user_photos_on_user_id", using: :btree

  create_table "user_videos", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "link"
    t.text     "description"
    t.text     "tags"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "user_videos", ["user_id"], name: "index_user_videos_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                     default: "", null: false
    t.string   "encrypted_password",        default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",             default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "role"
    t.string   "type"
    t.string   "profile"
    t.string   "avatar"
    t.string   "company"
    t.string   "skills",                    default: [],              array: true
    t.string   "services"
    t.string   "title"
    t.string   "brief_description"
    t.text     "bio"
    t.string   "keyword_tags"
    t.string   "phone_number"
    t.string   "city"
    t.string   "country"
    t.string   "skype_id"
    t.string   "website"
    t.string   "undergrad_school"
    t.string   "undergrad_major"
    t.string   "undergrad_graduation_year"
    t.string   "graduate_school"
    t.string   "graduate_major"
    t.string   "graduate_graduation_year"
    t.string   "experience_highlights_1"
    t.string   "experience_highlights_2"
    t.string   "experience_highlights_3"
    t.string   "experience_highlights_4"
    t.string   "experience_highlights_5"
    t.string   "experience_highlights_6"
    t.string   "experience_highlights_7"
    t.string   "experience_highlights_8"
    t.string   "experience_highlights_9"
    t.string   "experience_highlights_10"
    t.string   "interest_1"
    t.string   "interest_2"
    t.string   "interest_3"
    t.text     "investment_company_1"
    t.string   "investment_type_1"
    t.integer  "investment_year_1"
    t.string   "investment_stage_1"
    t.text     "investment_company_2"
    t.string   "investment_type_2"
    t.integer  "investment_year_2"
    t.string   "investment_stage_2"
    t.text     "investment_company_3"
    t.string   "investment_type_3"
    t.integer  "investment_year_3"
    t.string   "investment_stage_3"
    t.string   "angelist_url"
    t.string   "twitter_url"
    t.string   "facebook_url"
    t.string   "linkedin_url"
    t.string   "investment_size"
    t.string   "company_stage"
    t.string   "industries"
    t.string   "sectors"
    t.text     "preferences"
    t.string   "experience_level"
    t.string   "location"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "background_image"
    t.string   "industry"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "videos", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "title"
    t.text     "link"
    t.text     "description"
    t.text     "tags"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
