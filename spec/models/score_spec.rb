require 'rails_helper'

RSpec.describe Score, type: :model do
  describe "associations" do
    it { should belong_to(:card) }
    it { should belong_to(:user) }
  end
end
