FactoryBot.define do
  factory :purchase_address do
    post_code { '123-4567' }
    city { '大阪府' }
    house_number { '1-1' }
    phone_number { 11_122_223_333 }
    prefecture_id { 2 }
    building_name {'大阪ビル'}
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
