FactoryBot.define do
  factory :restaurant_batch_load_dto, class: Hash do
    skip_create

    initialize_with do
      {
        "restaurants" => [
          {
            "name" => "Testaurant",
            "menus" => [
              {
                "name" => "Lunch",
                "dishes" => [
                  { "name" => "Burger", "price" => 10.95 },
                  { "name" => "Salad", "price" => 8.95 }
                ]
              }
            ]
          }
        ]
      }
    end
  end
end
