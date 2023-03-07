class ExecutionsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_collection, only: %i[ new create ]
  before_action :set_execution, only: %i[ show ]

  def show; end

  def new
    @execution = Execution.new
  end

  def create
    @execution = Execution.new(execution_params)
    @execution.user = current_user
    @execution.collection = @collection

    if @execution.save
      CyclesAlgorithm.new(
        cards: @collection.cards, 
        execution: @execution
      ).send(:random)

      redirect_to @execution
    else
      render(
        turbo_stream: turbo_stream.replace(
          'execution_form', 
          partial: 'executions/form', 
          locals: { collection: @collection, execution: @execution }
        )
      )
    end
  end

  private

  def execution_params
    params.require(:execution).permit(:size)
  end

  def set_execution
    @execution = Execution.find(params[:id])
  end

  def set_collection
    @collection = Collection.find(params[:collection_id])
  end
end
  