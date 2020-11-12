FactoryBot.define do
  factory :user do
    nickname              { 'taro' }
    email                 { 'sample111@gmail.com' }
    password              { 'aiueo1234567' }
    password_confirmation { 'aiueo1234567' }
    last_name             { '山田' }
    first_name            { '太郎' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    birthday              { '2000-01-01' }
  end
end
