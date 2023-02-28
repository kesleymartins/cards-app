class Collection < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  has_many :cards, dependent: :destroy
  has_many :cycles, dependent: :destroy

  def current_cycle
    self.cycles.find_by(status: Cycle.statuses[:created])
  end
end
