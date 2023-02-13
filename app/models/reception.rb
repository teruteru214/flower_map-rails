class Reception < ApplicationRecord
  belongs_to :user
  belongs_to :unknown_flower

  validates :user_id, uniqueness: { scope: :unknown_flower_id }
end
