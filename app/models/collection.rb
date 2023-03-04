class Collection < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  belongs_to :user

  has_many :cards, dependent: :destroy
  has_many :cycles, dependent: :destroy

  def current_cycle
    Cycle.find_by(collection: self)
  end
end
