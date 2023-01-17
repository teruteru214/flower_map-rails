class FlowerWord < ApplicationRecord
  belongs_to :flower

  validates :name, length: { maximum: 65_535 }
  validates :word, length: { maximum: 65_535 }
end
