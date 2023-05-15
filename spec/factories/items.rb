FactoryBot.define do
  factory :item do
    item_name            { Faker::Lorem.sentence }
    description_of_item  { Faker::Lorem.sentence }
    item_category_id     { Faker::Date.between(from: 2, to: 10) }
    item_state_id        { Faker::Date.between(from: 2, to: 7) }
    shipping_charge_id   { Faker::Date.between(from: 2, to: 3) }
    prefecture_id        { Faker::Date.between(from: 2, to: 48) }
    days_to_delivery_id  { Faker::Date.between(from: 2, to: 4) }
    price                { Faker::Date.between(from: 300, to: 9_999_999) }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
