class Cycle < ApplicationRecord
  enum status: { created: 0, running: 1, closed: 2 }

  validates :size, presence: true, length: { minimum: 1 }

  belongs_to :collection
  has_many :cycle_cards, dependent: :destroy

  after_create :chose_cards

  def next_cycle_card
    self.cycle_cards.select { |cycle_card| cycle_card.waiting? }.first
  end

  def has_finished?
    self.progress == self.size
  end

  def increase_progress!
    self.update(progress: self.progress + 1)
  end

  private

  def chose_cards
    avaliable_cards = self.collection.cards
    selected_cards = avaliable_cards.shuffle.slice(1..self.size)

    selected_cards.each.with_index do |card, index|
      CycleCard.create!({
        order: index,
        status: CycleCard.statuses[:waiting],
        card: card,
        cycle: self
      })
    end
  end
end
