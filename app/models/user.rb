class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :family_name_jp_kanji, presence: true
  validates :first_name_jp_kanji, presence: true
  validates :family_name_jp_katakana, presence: true
  validates :first_name_jp_katakana, presence: true
  validates :birthday, presence: true
end
