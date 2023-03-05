class Cycle < ApplicationRecord
  validates :size, presence: true, length: { minimum: 1 }

  belongs_to :collection
  belongs_to :user
  
  def has_finished?
    self.progress == self.size
  end

  def increase_progress!
    self.update(progress: self.progress + 1)
  end
end
