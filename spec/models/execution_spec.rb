require 'rails_helper'

RSpec.describe Execution, type: :model do
  context "validations" do
    it { should validate_presence_of(:score) }
    it { should validate_presence_of(:size) }
  end

  context "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:collection) }
    it { should belong_to(:cycle).optional }
  end

  context "when created" do
    let(:execution) { create(:execution) }

    it "default score is 0" do
      expect(execution.score).to eq(0)
    end

    it "default status is running" do
      expect(execution.status).to eq(ExecutionStatus::RUNNING)
    end

    it "fix size when is bigger then collection.cards.size" do
      collection = create(:collection_with_cards)

      execution = create(:execution, 
        collection: collection, 
        size: collection.cards.count
      )

      expect(execution.size).to eq(collection.cards.size)
    end
  end
end
