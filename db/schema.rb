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

ActiveRecord::Schema.define(version: 20170926013955) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "binnacles", force: :cascade do |t|
    t.string "content"
    t.bigint "methodology_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["methodology_id"], name: "index_binnacles_on_methodology_id"
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
    t.bigint "user_id"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_methodologies_on_team_id"
    t.index ["user_id"], name: "index_methodologies_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_teams", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_user_teams_on_team_id"
    t.index ["user_id"], name: "index_user_teams_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "email"
    t.string "studies"
    t.string "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
