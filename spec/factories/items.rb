FactoryBot.define do
  factory :item do
    name                   { 'あああああ' }
    explanation            { '哲学書' }
    price                  { 500 }
    burden_id              { 1 }
    category_id            { 1 }
    number_of_month_id     { 1 }
    product_condition_id   { 1 }
    area_id                { 1 }
    user_id                { 1 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
