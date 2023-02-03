class UnknownFlower < ApplicationRecord
  belongs_to :user

  validates :feature, length: { maximum: 50000 }
  enum reception: { unresolved: 0, solution: 1 }
end
