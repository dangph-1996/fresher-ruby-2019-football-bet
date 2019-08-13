class League < ApplicationRecord
  has_many :seasons, dependent: :destroy
end
