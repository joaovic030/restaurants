class RestaurantBatchLoadDto
  SIMILARITY_DICT = { "dishes" => "menu_items" }

  attr_reader :restaurants_hash

  def initialize(restaurants_hash)
    @restaurants_hash = restaurants_hash
  end

  def to_h
    rewritten_data = rewrite_keys(restaurants_hash)

    rewritten_data
  end

  private

  def rewrite_keys(object)
    case object
    when Array
      object.map { |item| rewrite_keys(item) }
    when Hash
      new_hash = {}
      object.each do |key, value|
        new_key = rewrite_key(key)
        new_hash[new_key] = rewrite_keys(value)
      end
      new_hash
    else
      object
    end
  end

  def rewrite_key(key)
    if key.is_a?(String) && !key.end_with?("_attributes") &&
       %w[menus menu_items].include?(key)
      "#{key}_attributes"
    elsif key.is_a?(String) && !key.end_with?("_attributes") && SIMILARITY_DICT.key?(key)
      "#{SIMILARITY_DICT.fetch(key)}_attributes"
    else
      key
    end
  end
end
