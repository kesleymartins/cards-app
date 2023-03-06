class Cycle < ApplicationRecord
  belongs_to :card
  one_one :cycle
end
