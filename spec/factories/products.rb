FactoryGirl.define do
  factory :product do
    title "Title"
    description "MyText"
    rating 1
    price 2
    inet_price 3
    image "Image"

    trait :with_discount_price do
      price 100
      inet_price 90
    end

    trait :with_regular_price do
      price 100
      inet_price nil
    end

    trait :with_equal_price do
      price 120
      inet_price 120
    end

  end
end