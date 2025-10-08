FactoryBot.define do
  price = rand(10.0..400.0).round(2)

  factory :menu_item do
    name { Faker::Restaurant.name }
    description { Faker::Restaurant.description }
    price { price }
    cost { price - (price * 0.25) }
    menu
    menu_group
  end
end
