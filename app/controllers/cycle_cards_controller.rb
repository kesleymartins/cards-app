class CycleCardsController < ApplicationController
  def update
    @cycle_card = CycleCard.find(params[:id])
    @cycle_card.update(cycle_card_params)

    @cycle_card.cycle.increase_progress!

    if @cycle_card.cycle.has_finished?
      @cycle_card.cycle.destroy
      redirect_to root_path
    else
      render(
        turbo_stream: turbo_stream.update(
          :cycle_card, 
          partial: 'cycle_cards/show', 
          locals: { 
            cycle_card: nil, 
          }
        )
      )
    end
  end

  private

  def cycle_card_params
    params.require(:cycle_card).permit(:card_answer)
  end
end