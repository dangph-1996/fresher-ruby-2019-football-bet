class Round < ApplicationRecord
  belongs_to :season
  has_many :matchs, dependent: :destroy
end
