class Score < ApplicationRecord
  belongs_to :card
  belongs_to :user
  
  def increment!
    self.value += 1
    self.save
  end

  def decrement!
    self.value -= 1
    self.save
  end
end
