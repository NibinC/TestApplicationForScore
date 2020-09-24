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

ActiveRecord::Schema.define(version: 2020_09_22_165947) do

  create_table "players", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "Player", limit: 50
    t.string "Team"
    t.string "Pos"
    t.integer "Att"
    t.integer "Att/G"
    t.integer "Yds"
    t.float "Avg"
    t.integer "Yds/G"
    t.integer "TD"
    t.string "Lng"
    t.integer "1st"
    t.integer "1st%"
    t.integer "20+"
    t.integer "40+"
    t.integer "FUM"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["Player", "Yds", "Lng", "TD"], name: "index_players_on_Player_and_Yds_and_Lng_and_TD"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "first_name", limit: 30
    t.string "last_name", limit: 30
    t.string "email"
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
