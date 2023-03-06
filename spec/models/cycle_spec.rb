require 'rails_helper'

RSpec.describe Cycle, type: :model do
  describe "associations" do
    it { should have_one(:cycle) }
    it { should have_one(:execution) }
    it { should belong_to(:card) }
  end
end
