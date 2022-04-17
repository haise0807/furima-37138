FactoryBot.define do
  factory :purchase_address do
    post_code {'123-4567'}
    city {'大阪府'}
    house_number {'1-1'}
    phone_number {11122223333}
    prefecture_id {2}
  end
end
