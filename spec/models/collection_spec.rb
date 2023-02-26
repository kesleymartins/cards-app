require 'rails_helper'

RSpec.describe Collection, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
  end

  describe "associations" do
    it { should have_many(:cards) }
  end
end
