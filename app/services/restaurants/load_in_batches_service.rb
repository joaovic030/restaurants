class Restaurants::LoadInBatchesService
  class << self
    def run(hash)
      new(hash).run
    end
  end

  def initialize(hash, dto = RestaurantBatchLoadDto)
    @hash = hash
    @dto = dto.new(hash)
    @task_name = "restaurants_load_in_batches"
  end

  def run
    @dto.to_h.each do |restaurant_attr|
      restaurant = Restaurant.new(restaurant_attr)

      if restaurant.save
        message = "#{restaurant.to_s} | Successfully created" # rubocop:disable Lint/RedundantStringCoercion

        log(@task_name, message)
      else
        message = "#{restaurant.to_s} | Failed to create | #{restaurant.errors.full_messages}" # rubocop:disable Lint/RedundantStringCoercion

        log(@task_name, message)
      end
    end
  end

  def log(task, message)
    logger = Logger.new "#{task}.log"
    logger.progname = task
    logger.info message
  end
end
