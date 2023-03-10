require "rails_helper"

RSpec.describe User, type: :model do
  context "associations" do
    it { should have_many(:scores).dependent(:destroy) }
    it { should have_many(:executions).dependent(:destroy) }
    it { should have_many(:collections).dependent(:destroy) }
    it { should have_many(:favorites).dependent(:destroy) }
  end
end