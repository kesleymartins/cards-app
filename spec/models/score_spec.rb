require 'rails_helper'

RSpec.describe Score, type: :model do
  context "associations" do
    it { should belong_to(:card) }
    it { should belong_to(:user) }
  end

  context "when created" do
    let(:score) { create(:score) }

    it "default value is 0" do
      expect(score.value).to eq(0)
    end
  end

  context "methods" do
    let(:score) { create(:score) }

    it "#increment!" do
      old_value = score.value
      score.increment!

      expect(score.value).to eq(old_value + 1)
    end

    it "#decrement!" do
      old_value = score.value
      score.decrement!

      expect(score.value).to eq(old_value - 1)
    end
  end
end
