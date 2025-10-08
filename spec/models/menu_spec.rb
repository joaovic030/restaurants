require 'rails_helper'

RSpec.describe Menu, type: :model do
  subject(:menu) { create(:menu) }

  shared_examples 'menu is invalid' do
    it { expect(menu).not_to be_valid }
  end

  context "with valid attributes" do
    it { is_expected.to be_valid }
  end

  context "with invalid attributes" do
    context "when name is blank" do
      let(:menu) { build(:menu, name: nil) }

      it_behaves_like 'menu is invalid'
    end
  end
end
