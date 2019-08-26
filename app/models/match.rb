class Match < ApplicationRecord
  MATCH_PARAMS = %i(home_team_id guest_team_id start_time finish_time goals_home_team goals_guest_team round_id status).freeze
  enum status: {unfight: 0, fighting: 1, fought: 2}

  belongs_to :round
  belongs_to :home_team, class_name: FootballClub.name
  belongs_to :guest_team, class_name: FootballClub.name
end
