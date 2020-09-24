class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string "Player" , :limit=>50
      t.string "Team"
      t.string "Pos"
      t.integer "Att"
      t.integer "Att/G"
      t.integer "Yds"
      t.float "Avg"
      t.integer "Yds/G"
      t.integer "TD"
       t.string   "Lng"
       t.integer  "1st"
       t.integer  "1st%"
       t.integer  "20+"
       t.integer  "40+" 
    	t.integer "FUM"
       t.timestamps
       t.index ["Player","Yds","Lng","TD"]

    end
  end
end
