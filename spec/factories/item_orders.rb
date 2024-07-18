FactoryBot.define do
  factory :item_order do
    postal_code { Faker::Number.between(from: 100, to: 999).to_s + "-" + Faker::Number.between(from: 1000, to: 9999).to_s }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    city { Faker::Address.city }
    house_number { Faker::Address.street_address }
    building_name { Faker::Address.building_number }
    phone_num { "0" + Faker::Number.between(from: 100000000, to: 9999999999).to_s }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
