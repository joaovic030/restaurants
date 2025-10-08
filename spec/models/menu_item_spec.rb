require 'rails_helper'

RSpec.describe MenuItem, type: :model do
  subject(:menu_item) { create(:menu_item) }

  shared_examples 'menu_item is invalid' do
    it { expect(menu_item).not_to be_valid }
  end

  context "with valid attributes" do
    it { is_expected.to be_valid }
  end

  context "with invalid attributes" do
    context "when name is blank" do
      let(:menu_item) { build(:menu_item, name: nil) }

      it_behaves_like 'menu_item is invalid'
    end

    context "when name is blank" do
      let(:menu_item) { build(:menu_item, name: nil) }

      it_behaves_like 'menu_item is invalid'
    end

    context "when description is blank" do
      let(:menu_item) { build(:menu_item, description: nil) }

      it_behaves_like 'menu_item is invalid'
    end

    context "when price is blank" do
      let(:menu_item) { build(:menu_item, price: nil) }

      it_behaves_like 'menu_item is invalid'
    end

    context "when cost is blank" do
      let(:menu_item) { build(:menu_item, cost: nil) }

      it_behaves_like 'menu_item is invalid'
    end
  end
end
