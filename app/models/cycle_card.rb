class CycleCard < ApplicationRecord
  attribute :card_answer, :string

  validates :order, presence: true

  belongs_to :card
  belongs_to :cycle

  after_update :score_card
  
  private

  def score_card
    score = Score.find_by(
      card: self.card,
      user: self.cycle.user
    )

    unless score
      score = Score.create!({
        card: self.card,
        user: self.cycle.user
      })
    end

    if self.card_answer == 'error'
      score.decrement!
    elsif self.card_answer == 'success' 
      score.increment!
    end
  end
end
