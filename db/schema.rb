# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_08_13_040700) do

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.bigint "new_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["new_id"], name: "index_comments_on_new_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "football_clubs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "member"
    t.string "stadium"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "leagues", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "matches", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "home_team"
    t.integer "guest_team"
    t.datetime "start_time"
    t.datetime "finish_time"
    t.integer "goals_home_team"
    t.integer "goals_guest_team"
    t.bigint "rounds_id"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["rounds_id"], name: "index_matches_on_rounds_id"
  end

  create_table "news", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "image"
    t.integer "status"
    t.bigint "category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_news_on_category_id"
  end

  create_table "players", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.integer "number"
    t.string "country"
    t.datetime "birthday"
    t.bigint "football_clubs_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["football_clubs_id"], name: "index_players_on_football_clubs_id"
  end

  create_table "rankings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "seasons_id"
    t.bigint "football_clubs_id"
    t.integer "goals_number"
    t.integer "goals_lost_number"
    t.integer "games_win"
    t.integer "games_lost"
    t.integer "games_draw"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["football_clubs_id"], name: "index_rankings_on_football_clubs_id"
    t.index ["seasons_id"], name: "index_rankings_on_seasons_id"
  end

  create_table "rounds", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "round_number"
    t.bigint "seasons_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["seasons_id"], name: "index_rounds_on_seasons_id"
  end

  create_table "seasons", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "finish_time"
    t.bigint "league_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["league_id"], name: "index_seasons_on_league_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "avatar"
    t.integer "role"
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "news", column: "new_id"
  add_foreign_key "comments", "users"
  add_foreign_key "matches", "rounds", column: "rounds_id"
  add_foreign_key "news", "categories"
  add_foreign_key "players", "football_clubs", column: "football_clubs_id"
  add_foreign_key "rankings", "football_clubs", column: "football_clubs_id"
  add_foreign_key "rankings", "seasons", column: "seasons_id"
  add_foreign_key "rounds", "seasons", column: "seasons_id"
  add_foreign_key "seasons", "leagues"
end
