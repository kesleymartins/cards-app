class Collection < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  belongs_to :user

  has_many :cards, dependent: :destroy
  has_many :executions, dependent: :destroy

  def can_execute?
    not self.cards.empty?
  end

  def execution
    Execution.find_by(
      collection: self,
      user: self.user,
      status: ExecutionStatus::RUNNING
    )
  end
end
