class Collection < ApplicationRecord
  has_enumeration_for :privacy, create_helpers: true
  
  validates :title, presence: true
  validates :description, presence: true
  validates :privacy, presence: true

  belongs_to :user
  has_many :cards, dependent: :destroy
  has_many :executions, dependent: :destroy
  has_many :favorites, dependent: :destroy

  scope :only_public, -> { where(privacy: Privacy::PUBLIC) }
  scope :owned_by, -> (owner) { where(user: owner) }

  def execution
    Execution.find_by(
      collection: self,
      user: self.user,
      status: ExecutionStatus::RUNNING
    )
  end

  def self.ransackable_attributes(auth_object = nil)
    ["title"]
  end
end
