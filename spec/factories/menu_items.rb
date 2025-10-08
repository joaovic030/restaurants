FactoryBot.define do
  factory :menu_item do
    name { "MyText" }
    description { "MyText" }
    price { "9.99" }
    cost { "9.99" }
    menu { nil }
    menu_group { nil }
  end
end
