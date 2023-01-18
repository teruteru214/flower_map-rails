class FlowerWord < ApplicationRecord
  validates :name, presence: true
  validates :word, presence: true
end
