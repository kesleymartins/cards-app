class Cycle < ApplicationRecord
  enum status: { created: 0, running: 1, closed: 2 }

  validates :size, presence: true, length: { minimum: 1 }

  belongs_to :collection
  has_many :cycle_cards, dependent: :destroy
end
