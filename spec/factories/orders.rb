FactoryBot.define do
  factory :order do
    token             { 'tok_abcdefghijk00000000000000000' }
    zip_code          { '812-2218' }
    area_id           { 1 }
    city              { '福岡市' }
    street_number     { '1111' }
    telephone_number  { '0000000000' }
  end
end
