class CycleLinker
  def initialize(cycle:)
    @cycle = cycle
    @execution = cycle.execution
  end

  def call(type:)
    self.send(type.to_sym)
  end

  private

  def success
    @execution.update!({
      score: @execution.score + 1,
      cycle_id: @cycle.next_id 
    })

    @cycle.destroy
  end

  def error
    @execution.update!({
      score: @execution.score - 1,
      cycle_id: @cycle.next_id 
    })

    @cycle.destroy
  end
end