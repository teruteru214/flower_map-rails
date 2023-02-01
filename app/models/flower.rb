class Flower < ApplicationRecord
  mount_uploader :flower_image, FlowerImageUploader
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :address, presence: true, length: { maximum: 5000 }
  validates :address_detail, length: { maximum: 5000 }
  validates :date, presence: true

  enum status: { bad: 0, rather_bad: 1, usually: 2, good: 3, beautiful: 4 }
end
