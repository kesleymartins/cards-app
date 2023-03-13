require 'rails_helper'

RSpec.describe Favorite, type: :model do
  context "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:collection) }
  end 
end
