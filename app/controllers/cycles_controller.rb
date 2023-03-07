class CyclesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cycle

  def show
    render(
      turbo_stream: turbo_stream.replace(
        :cycle, 
        partial: 'cycles/show', 
        locals: { cycle: @cycle }
      )
    )
  end

  def update
    ScoreCard.new(
      cycle: @cycle, 
      user: current_user
    ).call(type: cycle_params[:type])

    if @cycle.is_last?
      redirect_to root_path
    end
  end

  private

  def cycle_params
    params.require(:cycle).permit(:type)
  end

  def set_cycle
    @cycle = Cycle.find(params[:id])
  end
end
