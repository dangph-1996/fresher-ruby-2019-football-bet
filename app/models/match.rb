class Match < ApplicationRecord
  belongs_to :round
  belongs to :home_team, class_name: FootballClub.name
  belongs to :guest_team, class_name: FootballClub.name
end
