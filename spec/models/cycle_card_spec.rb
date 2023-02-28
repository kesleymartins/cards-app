require 'rails_helper'

RSpec.describe CycleCard, type: :model do
  context "validations" do
    it { should validate_presence_of(:status) }
  end

  context "associations" do
    it { should belong_to(:cycle) }
    it { should belong_to(:card) }
  end
end
