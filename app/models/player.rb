class Player < ApplicationRecord

def self.to_csv
	CSV.generate do |csv|
		csv<< column_names
		all.each do |player|
			csv << player.attributes.values_at(*column_names)
		end
	end

end

scope :find_player_by_name, ->(name){where(["Player LIKE ?","%#{name}%"])}

end
