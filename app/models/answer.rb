class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :unknown_flower

  validation :body, presence: true, maximum: '10000'
end
