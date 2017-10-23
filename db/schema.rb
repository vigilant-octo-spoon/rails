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

ActiveRecord::Schema.define(version: 20171023161820) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "binnacles", force: :cascade do |t|
    t.date "start_date"
    t.date "finish_date"
    t.text "objectives"
    t.text "observations"
    t.text "advances"
    t.text "obstacles"
    t.text "ideas"
    t.bigint "follows_methodologies_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follows_methodologies_id"], name: "index_binnacles_on_follows_methodologies_id"
  end

  create_table "broadcasts", force: :cascade do |t|
    t.string "moment_of_implementation", default: "Antes"
    t.string "audience"
    t.string "diffusion_channel"
    t.string "objective"
    t.bigint "follows_methodologies_id"
    t.index ["follows_methodologies_id"], name: "index_broadcasts_on_follows_methodologies_id"
  end

  create_table "conditions", force: :cascade do |t|
    t.string "item"
    t.text "info"
    t.bigint "follows_methodologies_id"
    t.index ["follows_methodologies_id"], name: "index_conditions_on_follows_methodologies_id"
  end

  create_table "evaluations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "methodology_id"
    t.float "score"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["methodology_id"], name: "index_evaluations_on_methodology_id"
    t.index ["user_id"], name: "index_evaluations_on_user_id"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "methodology_id"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["methodology_id"], name: "index_feedbacks_on_methodology_id"
    t.index ["user_id"], name: "index_feedbacks_on_user_id"
  end

  create_table "follows_methodologies", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "methodology_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["methodology_id"], name: "index_follows_methodologies_on_methodology_id"
    t.index ["user_id"], name: "index_follows_methodologies_on_user_id"
  end

  create_table "methodologies", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "link_video"
    t.string "category"
    t.string "organization"
    t.string "author"
  end

  create_table "plannings", force: :cascade do |t|
    t.string "initiative__name"
    t.string "objective"
    t.string "place"
    t.date "start_date"
    t.date "finish_date"
    t.bigint "follows_methodologies_id"
    t.index ["follows_methodologies_id"], name: "index_plannings_on_follows_methodologies_id"
  end

  create_table "resources", force: :cascade do |t|
    t.string "item"
    t.boolean "available", default: false
    t.text "acquisition"
    t.bigint "follows_methodologies_id"
    t.index ["follows_methodologies_id"], name: "index_resources_on_follows_methodologies_id"
  end

  create_table "users", force: :cascade do |t|
    t.boolean "admin"
    t.string "username"
    t.string "password"
    t.string "email", default: "", null: false
    t.string "studies"
    t.string "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "authentication_token", limit: 30
    t.string "name"
    t.string "last_name"
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "work_roles", force: :cascade do |t|
    t.string "name"
    t.string "role"
    t.bigint "follows_methodologies_id"
    t.index ["follows_methodologies_id"], name: "index_work_roles_on_follows_methodologies_id"
  end

end
