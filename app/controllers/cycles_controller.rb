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
    if @cycle.is_last?
      redirect_to root_path
    end
  end

  private

  def set_cycle
    @cycle = Cycle.find(params[:id])
  end
end
