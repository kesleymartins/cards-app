require 'rails_helper'

RSpec.describe Execution, type: :model do
  describe "validations" do
    it { should validate_presence_of(:score) }
    it { should validate_presence_of(:size) }
  end

  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:collection) }
    it { should belong_to(:cycle).optional }
  end
end
