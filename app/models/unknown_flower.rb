class UnknownFlower < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :answers, dependent: :destroy

  validates :feature, length: { maximum: 50000 }
  enum reception: { unresolved: 0, solution: 1 }
end
