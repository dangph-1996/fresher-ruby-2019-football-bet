class Category < ApplicationRecord
  CATEGORY_PARAMS = %i(name).freeze

  has_many :newspapers, dependent: :destroy
end
