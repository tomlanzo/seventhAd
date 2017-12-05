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

ActiveRecord::Schema.define(version: 20171205105042) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.integer "choice"
    t.boolean "correct", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "session_id"
    t.bigint "player_id"
    t.bigint "question_id"
    t.index ["player_id"], name: "index_answers_on_player_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["session_id"], name: "index_answers_on_session_id"
  end

  create_table "cinemas", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.string "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.index ["company_id"], name: "index_players_on_company_id"
  end

  create_table "questions", force: :cascade do |t|
    t.integer "position"
    t.string "title"
    t.string "answer_1"
    t.string "answer_2"
    t.string "answer_3"
    t.string "answer_4"
    t.integer "correct_answer", null: false
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "game_id"
    t.index ["game_id"], name: "index_questions_on_game_id"
  end

  create_table "seances", force: :cascade do |t|
    t.string "room"
    t.string "movie"
    t.datetime "start_at"
    t.bigint "cinema_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cinema_id"], name: "index_seances_on_cinema_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.bigint "game_id"
    t.string "short_url"
    t.datetime "opened_at"
    t.bigint "seance_id"
    t.index ["company_id"], name: "index_sessions_on_company_id"
    t.index ["game_id"], name: "index_sessions_on_game_id"
    t.index ["seance_id"], name: "index_sessions_on_seance_id"
  end

  add_foreign_key "answers", "players"
  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "sessions"
  add_foreign_key "players", "companies"
  add_foreign_key "questions", "games"
  add_foreign_key "seances", "cinemas"
  add_foreign_key "sessions", "companies"
  add_foreign_key "sessions", "games"
  add_foreign_key "sessions", "seances"
end
