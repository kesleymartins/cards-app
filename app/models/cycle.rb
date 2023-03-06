class Cycle < ApplicationRecord
  has_one :cycle
  has_one :executions
  belongs_to :card

  def next_cycle
    self.card
  end

  def is_last?
    self.card.nil?
  end
end
