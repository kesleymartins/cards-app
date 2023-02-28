require 'rails_helper'

RSpec.describe Card, type: :model do
  context "validations" do
    it { should validate_presence_of(:question) }
    it { should validate_presence_of(:awser) }  
  end

  context "associations" do
    it { should belong_to(:collection) }
    it { should have_many(:cycle_cards).dependent(:destroy) }
  end
end
