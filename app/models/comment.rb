class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :flower

  validates :body, presence: true, length: { maximum: 100 }
end
