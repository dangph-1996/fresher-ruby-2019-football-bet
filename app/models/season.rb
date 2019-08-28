class Season < ApplicationRecord
  SEASON_PARAMS = %i(start_time finish_time league_id).freeze
  
  belongs_to :league
  has_many :rounds
  has_one :ranking

  delegate :name, to: :league, prefix: true

  validates :start_time, presence: true
  validates :finish_time, presence: true
end
