FactoryBot.define do
  factory :user do
    nickname              { 'john' }
    email                 { Faker::Internet.free_email }
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name_jp_kanji  { '吉村' } 
    first_name_jp_kanji   { '卓也' } 
    family_name_jp_katakana { 'ヨシムラ' }
    first_name_jp_katakana { 'タクヤ' }
    birthday { '19890302' }
  end
end
