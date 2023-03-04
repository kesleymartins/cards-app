require 'rails_helper'

RSpec.describe Cycle, type: :model do
  describe "validations" do
    it { should validate_presence_of(:size) }
    it { should validate_length_of(:size).is_at_least(1) }
  end

  describe "associations" do
    it { should belong_to(:collection) }
    it { should belong_to(:user) }

    it { should have_many(:cycle_cards).dependent(:destroy) }
  end
end
