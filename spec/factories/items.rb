FactoryBot.define do
  factory :item do
    name                   { 'あああああ' }
    explanation            { '哲学書' }
    price                  { 500 }
    burden_id              { 3 }
    category_id            { 3 }
    number_of_month_id     { 3 }
    product_condition_id   { 3 }
    area_id                { 3 }
    user_id                { 3 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
