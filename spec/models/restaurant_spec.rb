require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  subject(:restaurant) { create(:restaurant) }

  shared_examples 'restaurant is invalid' do
    it { expect(restaurant).not_to be_valid }
  end

  context "with valid attributes" do
    it { is_expected.to be_valid }
  end

  context "with invalid attributes" do
    context "when name is blank" do
      let(:restaurant) { build(:restaurant, name: nil) }

      it_behaves_like 'restaurant is invalid'
    end
  end
end
