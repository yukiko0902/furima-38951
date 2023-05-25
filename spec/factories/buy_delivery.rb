FactoryBot.define do
  factory :buy_delivery do
    user_id           { Faker::Number.non_zero_digit }
    item_id           { Faker::Number.non_zero_digit }
    postcode          {'123-4567'}
    prefecture_id     { Faker::Date.between(from: 2, to: 48) }
    municipality      { Faker::Address.city }
    address           { Faker::Address.street_address}
    building_name     { Faker::Address.street_address}
    telephone_number  { Faker::Number.decimal_part(digits: 11)}
    token             { "tok_abcdefghijk00000000000000000" } 
  end
end
