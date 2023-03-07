class Execution < ApplicationRecord
  validates :score, presence: true
  validates :size, presence: true

  belongs_to :collection
  belongs_to :user
  belongs_to :cycle, optional: true

  before_create :set_default_status

  private

  def set_default_status
    self.status = ExecutionStatus::RUNNING
  end
end
