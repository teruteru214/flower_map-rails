class User < ApplicationRecord
  authenticates_with_sorcery!
  mount_uploader :avatar, AvatarUploader

  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications
  has_many :flowers, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_flowers, through: :favorites, source: :flower
  has_many :unknown_flowers, dependent: :destroy
  has_many :receptions, dependent: :destroy
  has_many :reception_unknown_flowers, through: :receptions, source: :unknown_flower
  has_many :answers, dependent: :destroy

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true, length: { maximum: 30 }

  def own?(object)
    id == object.user_id
  end

  def reception(unknown_flower)
    reception_unknown_flowers << unknown_flower
  end

  def unreception(unknown_flower)
    reception_unknown_flowers.destroy(unknown_flower)
  end

  def reception?(unknown_flower)
    reception_unknown_flowers.include?(unknown_flower)
  end

  def favorite(flower)
    favorite_flowers << flower
  end

  def unfavorite(flower)
    favorite_flowers.destroy(flower)
  end

  def favorite?(flower)
    favorite_flowers.include?(flower)
  end
end
