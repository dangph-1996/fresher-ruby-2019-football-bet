class FootballClub < ApplicationRecord
  has_many :players, dependent: :destroy
  has_many :rankings, dependent: :destroy
  has_many :home_team, class_name: Match.name, foreign_key: "home_team",
    dependent: :destroy
  has_many :guest_team, class_name: Match.name, foreign_key: "guest_team",
    dependent: :destroy
end
