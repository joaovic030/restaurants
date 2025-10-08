FactoryBot.define do
  factory :menu do
    name { Faker::Company.name + " Menu #{rand(9999)}" }
    description { Faker::Adjective.positive }

    association :restaurant
  end
end
