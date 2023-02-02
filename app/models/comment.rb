class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :flower

  validates :body, presence: true, length: { maximum: 1000 }
  enum evaluation: { bad: 0, rather_bad: 1, usually: 2, good: 3, beautiful: 4 }
end
