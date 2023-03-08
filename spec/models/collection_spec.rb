require 'rails_helper'

RSpec.describe Collection, type: :model do
  context "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
  end

  context "associations" do
    it { should have_many(:cards).dependent(:destroy) }
    it { should have_many(:executions).dependent(:destroy) }
    it { should belong_to(:user) }
  end

  context "execution" do
    let(:collection) { create(:collection) }
    let(:collection_with_cards) { create(:collection_with_cards)}

    it "cant create execution" do
      expect(collection_with_cards.can_execute?).to be(true)
    end 
    
    it "cannot create execution" do
      expect(collection.can_execute?).to be(false)
    end
  end
end
