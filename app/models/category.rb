class Category < ApplicationRecord
  CATEGORY_PARAMS = %i(name).freeze

  has_many :news, dependent: :destroy
end
