FactoryBot.define do
  factory :item do
    item_name        {Faker::Lorem.word }
    information      {Faker::Lorem.word }
    price            {Faker::Number.within(range: 300..9999999)}
    category_id      { 2 }
    condition_id     { 2 }
    shipping_fee_id  { 2 }
    prefecture_id    { 2 }
    shipping_day_id  { 2 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
