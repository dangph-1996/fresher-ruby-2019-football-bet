class Category < ApplicationRecord
  CATEGORY_PARAMS = %i(name).freeze

  has_many :new, dependent: :destroy
end
