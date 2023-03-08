require 'rails_helper'

RSpec.describe Cycle, type: :model do
  context "associations" do
    it { should have_one(:execution) }
    it { should belong_to(:card) }
    it { should have_one(:cycle).class_name('Cycle').with_foreign_key('next_id') }
  end
end
