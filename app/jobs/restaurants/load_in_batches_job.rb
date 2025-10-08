class Restaurants::LoadInBatchesJob < ApplicationJob
  queue_as :default

  def perform(restaurants_json)
    restaurants_hash = JSON.parse(restaurants_json)

    Restaurants::LoadInBatchesService.run(restaurants_hash["restaurants"])
  end
end
