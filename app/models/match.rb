class Match < ApplicationRecord
  belongs_to :round
  belongs_to :home_team, class_name: FootballClub.name
  belongs_to :guest_team, class_name: FootballClub.name
end
