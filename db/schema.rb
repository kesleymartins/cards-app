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

ActiveRecord::Schema[7.0].define(version: 2023_03_06_004630) do
  create_table "cards", force: :cascade do |t|
    t.text "question"
    t.text "answer"
    t.integer "collection_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collection_id"], name: "index_cards_on_collection_id"
  end

  create_table "collections", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_collections_on_user_id"
  end

  create_table "cycles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "card_id", null: false
    t.integer "cycle_id"
    t.index ["card_id"], name: "index_cycles_on_card_id"
    t.index ["cycle_id"], name: "index_cycles_on_cycle_id"
  end

  create_table "executions", force: :cascade do |t|
    t.integer "score", default: 0
    t.integer "user_id", null: false
    t.integer "collection_id", null: false
    t.integer "cycle_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collection_id"], name: "index_executions_on_collection_id"
    t.index ["cycle_id"], name: "index_executions_on_cycle_id"
    t.index ["user_id"], name: "index_executions_on_user_id"
  end

  create_table "scores", force: :cascade do |t|
    t.integer "value", default: 0
    t.integer "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["card_id"], name: "index_scores_on_card_id"
    t.index ["user_id"], name: "index_scores_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "collections", "users"
  add_foreign_key "cycles", "cards"
  add_foreign_key "cycles", "cycles"
  add_foreign_key "executions", "collections"
  add_foreign_key "executions", "cycles"
  add_foreign_key "executions", "users"
  add_foreign_key "scores", "users"
end
