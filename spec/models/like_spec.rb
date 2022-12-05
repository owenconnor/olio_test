require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'validations' do
    describe "#liked_item_id" do
      it { is_expected.to validate_presence_of(:liked_item_id) }
      it { is_expected.to_not allow_value("blah").for(:liked_item_id) }
      it { is_expected.to allow_value(1234567).for(:liked_item_id) }
    end
    describe "#liked_item_type" do
      it { is_expected.to validate_presence_of(:liked_item_type) }
      it { is_expected.to_not allow_value("blah").for(:liked_item_type) }
      it { is_expected.to validate_inclusion_of(:liked_item_type).in_array(%w[olio_item]) }
    end
  end
end
