require 'rails_helper'

RSpec.describe MenuGroup, type: :model do
  subject(:menu_group) { create(:menu_group) }

  shared_examples 'menu_group is invalid' do
    it { expect(menu_group).not_to be_valid }
  end

  context "with valid attributes" do
    it { is_expected.to be_valid }
  end

  context "with invalid attributes" do
    context "when name is blank" do
      let(:menu_group) { build(:menu_group, name: nil) }

      it_behaves_like 'menu_group is invalid'
    end
  end
end
