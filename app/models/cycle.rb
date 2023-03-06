class Cycle < ApplicationRecord
  belongs_to :card
  one_one :cycle

  def next_cycle
    self.card
  end

  def is_last?
    self.card.nil?
  end
end
