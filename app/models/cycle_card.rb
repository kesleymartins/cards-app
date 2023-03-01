class CycleCard < ApplicationRecord
  enum status: { waiting: 0, answered: 1 }

  validates :status, presence: true
  validates :order, presence: true

  belongs_to :card
  belongs_to :cycle
end
