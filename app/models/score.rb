class Score < ApplicationRecord
  belongs_to :card

  def increment!
    self.value += 1
    self.save
  end

  def decrement!
    self.value -= 1
    self.save
  end
end
