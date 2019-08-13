class Season < ApplicationRecord
  belongs_to :league
  has_many :rounds, dependent: :destroy
  has_one :ranking
end
