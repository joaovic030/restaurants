FactoryBot.define do
  factory :menu_group do
    name { Faker::Restaurant.type }
    description {  Faker::Lorem.sentence }
  end
end
