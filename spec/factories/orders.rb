FactoryBot.define do
  factory :order do
    customer_name { Faker::Name.name }
    phone { Faker::PhoneNumber.cell_phone }
    address { Faker::Address.full_address }
    total_price { Faker::Commerce.price(range: 100..1000.0) }
    status { "PENDING" }
  end
end
