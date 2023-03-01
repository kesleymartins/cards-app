class CycleCardsController < ApplicationController
  def show
    @cycle_card = CycleCard.find(params[:id])
  end
end