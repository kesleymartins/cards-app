class CyclesAlgorithm
  def initialize(cards:, execution:)
    @cards = cards.slice(0..execution.size-1)
    @execution = execution
  end

  private

  def random
    last_cycle = nil

    @cards.shuffle.each.with_index do |card, index|
      last_cycle = Cycle.create!(
        card: card,
        cycle: last_cycle
      )

      if index == 0
        @execution.update({ cycle: last_cycle })
      end
    end
  end
end