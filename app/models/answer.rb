class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :unknown_flower

  validates :body, presence: true, length: { maximum: 10000 }
end
