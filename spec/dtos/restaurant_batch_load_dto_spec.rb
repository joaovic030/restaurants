require 'rails_helper'

RSpec.describe RestaurantBatchLoadDto do
  describe "#to_h" do
    let(:input_hash) { build(:restaurant_batch_load_dto) }
    subject(:dto) { described_class.new(input_hash) }

    it "rewrites keys appending _attributes" do
      result = dto.to_h

      expect(result).to include("restaurants")
      expect(result["restaurants"].first).to include("menus_attributes")
      expect(result["restaurants"].first["menus_attributes"].first).to include("name" => "Lunch")

      # dishes is rewritten using SIMILARITY_DICT to menu_items_attributes
      expect(result["restaurants"].first["menus_attributes"].first).to have_key("menu_items_attributes")
      items = result["restaurants"].first["menus_attributes"].first["menu_items_attributes"]
      expect(items).to be_an(Array)
      expect(items.first).to include("name" => "Burger", "price" => 10.95)
    end

    it "does not modify keys that already have _attributes suffix" do
      input = {
        "menus_attributes" => [
          {
            "menu_items_attributes" => [
              { "name" => "Pizza" }
            ]
          }
        ]
      }
      dto = described_class.new(input)
      result = dto.to_h

      expect(result.keys).to include("menus_attributes")
      expect(result["menus_attributes"].first.keys).to include("menu_items_attributes")
    end
  end
end
