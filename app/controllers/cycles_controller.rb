class CyclesController < ApplicationController
  before_action :set_collection, except: %i[ show ]
  before_action :set_cycle, only: %i[ show ]

  def show; end

  def new
    @cycle = Cycle.new
  end

  def create
    @cycle = Cycle.new(cycle_params)
    @cycle.collection = @collection
    
    if @cycle.save
      redirect_to cycle_path(@cycle), notice: "Ciclo iniciado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def cycle_params
    params.require(:cycle).permit(:size)
  end

  def set_cycle
    @cycle = Cycle.find(params[:id])
  end

  def set_collection
    @collection = Collection.find(params[:collection_id])
  end
end
