class Execution < ApplicationRecord
  validates :score, presence: true
  validates :size, presence: true

  belongs_to :collection
  belongs_to :user
  belongs_to :cycle, optional: true

  before_create :set_default_status, :fix_size

  private

  def set_default_status
    self.status = ExecutionStatus::RUNNING
  end

  def fix_size
    cards_length = self.collection.cards.count

    if self.size > cards_length
      self.size = cards_length
    end
  end
end
