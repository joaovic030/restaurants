require 'rails_helper'

RSpec.describe "/menu_items", type: :request do
  let!(:menu) { create(:menu) }
  let!(:menu_group) { create(:menu_group) }

  let(:valid_attributes) {
    attributes_for(:menu_item).merge({ menu_id: menu.id, menu_group_id: menu_group.id })
  }

  let(:invalid_attributes) {
    attributes_for(:menu_item, price: nil).merge({ menu_id: nil, menu_group_id: menu_group.id })
  }

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      MenuItem.create! valid_attributes
      get menu_items_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      menu_item = MenuItem.create! valid_attributes
      get menu_item_url(menu_item), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new MenuItem" do
        expect {
          post menu_items_url,
               params: { menu_item: valid_attributes }, headers: valid_headers, as: :json
        }.to change(MenuItem, :count).by(1)
      end

      it "renders a JSON response with the new menu_item" do
        post menu_items_url,
             params: { menu_item: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new MenuItem" do
        expect {
          post menu_items_url,
               params: { menu_item: invalid_attributes }, as: :json
        }.to change(MenuItem, :count).by(0)
      end

      it "renders a JSON response with errors for the new menu_item" do
        post menu_items_url,
             params: { menu_item: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_content)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          name: "New dish test"
        }
      }

      it "updates the requested menu_item" do
        menu_item = MenuItem.create! valid_attributes
        patch menu_item_url(menu_item),
              params: { menu_item: new_attributes }, headers: valid_headers, as: :json
        menu_item.reload

        expect(menu_item.name).to eq(new_attributes[:name])
      end

      it "renders a JSON response with the menu_item" do
        menu_item = MenuItem.create! valid_attributes
        patch menu_item_url(menu_item),
              params: { menu_item: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the menu_item" do
        menu_item = MenuItem.create! valid_attributes
        patch menu_item_url(menu_item),
              params: { menu_item: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_content)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested menu_item" do
      menu_item = MenuItem.create! valid_attributes
      expect {
        delete menu_item_url(menu_item), headers: valid_headers, as: :json
      }.to change(MenuItem, :count).by(-1)
    end
  end
end
