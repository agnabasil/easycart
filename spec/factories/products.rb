FactoryBot.define do
  factory :product do
    title { Faker::Commerce.product_name }
    slug { title.parameterize }
    price { Faker::Commerce.price(range: 100..1000.0) }
    description { Faker::Lorem.paragraph }
    category { %w[phones laptops audio wearables].sample }
    stock { 100 }
    images { [ Faker::LoremFlickr.image ] }

    trait :discounted do
      discounted_price { price * 0.8 }
    end
  end
end
