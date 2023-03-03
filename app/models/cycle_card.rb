class CycleCard < ApplicationRecord
  attribute :card_answer, :string

  enum status: { waiting: 0, answered: 1 }

  validates :status, presence: true
  validates :order, presence: true

  belongs_to :card
  belongs_to :cycle

  before_update :mark_as_answered
  after_update :score_card
  
  private

  def mark_as_answered
    self.status = CycleCard.statuses[:answered] 
  end

  def score_card
    score = Score.find_by(card: self.card)

    unless score
      score = Score.create!({card: self.card})
    end

    if self.card_answer == 'error'
      score.decrement!
    elsif self.card_answer == 'success' 
      score.increment!
    end
  end
end
