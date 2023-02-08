class UnknownFlower < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :answers, dependent: :destroy

  validates :feature, presence: true, length: { maximum: 50000 }
end
