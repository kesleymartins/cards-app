class ScoreCard
  def initialize(cycle:, user:)
    @score = Score.find_by(
      user: user,
      card: cycle.card
    )

    if @score.nil?
      @score = Score.create!(
        user: user,
        card: cycle.card
      )
    end
  end

  def call(type:)
    self.send(type.to_sym)
  end

  private

  def success
    @score.update!({value: @score.value + 1})
  end

  def error
    @score.update!({value: @score.value - 1})
  end
end