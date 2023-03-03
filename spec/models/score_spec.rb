require 'rails_helper'

RSpec.describe Score, type: :model do
  describe "associations" do
    it { should belong_to(:card) }
  end
end
