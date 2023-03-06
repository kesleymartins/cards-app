class Execution < ApplicationRecord
  validates :score, presence: true
  validates :size, presence: true

  belongs_to :collection
  belongs_to :user
  belongs_to :cycle, optional: true
end
