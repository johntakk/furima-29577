class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX, message: 'need to be include both letters and numbers' 

  validates :nickname, presence: true
  validates :birthday, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'Full-width characters' } do
   validates :family_name_jp_kanji, presence: true
   validates :first_name_jp_kanji, presence: true
   validates :family_name_jp_katakana, presence: true
   validates :first_name_jp_katakana, presence: true
  end
end
