require "rails_helper"

RSpec.describe MenuGroupsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/menu_groups").to route_to("menu_groups#index")
    end

    it "routes to #show" do
      expect(get: "/menu_groups/1").to route_to("menu_groups#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/menu_groups").to route_to("menu_groups#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/menu_groups/1").to route_to("menu_groups#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/menu_groups/1").to route_to("menu_groups#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/menu_groups/1").to route_to("menu_groups#destroy", id: "1")
    end
  end
end
