class Newspaper < ApplicationRecord
  NEWSPAPER_PARAMS = %i(title description image status content category_id).freeze
  enum status: {hot: 1, most_new: 2, normal: 0}

  has_one_attached :image
  mount_uploader :image, ImageUploader

  has_many :comments, dependent: :destroy
  belongs_to :category

  validates :title, presence: true
  validates :description, presence: true

  delegate :name, to: :category, prefix: true

  scope :ordered_by_newspaper_id, -> {order(id: :desc)}
  scope :by_status_hot, -> { where(status: 1) }
end
