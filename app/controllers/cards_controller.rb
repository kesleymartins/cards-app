class CardsController < ApplicationController
  before_action :set_collection
  before_action :set_card, only: %i[ edit update destroy ]
  
  def index
    @pagy, @cards = pagy(Card.where(collection: @collection).latest)
  end

  def new
    @card = Card.new
  end

  def edit; end

  def create
    @card = Card.new(card_params)
    @card.collection = @collection

    if @card.save
      redirect_to collection_cards_path(@collection), notice: 'Carta criada com sucesso!'
    else
      render(
        turbo_stream: turbo_stream.replace(
          'cards_form', 
          partial: 'cards/form', 
          locals: { collection: @collection, card: @card }
        )
      )
    end
  end

  def update
    if @card.update(card_params)
      redirect_to collection_cards_path(@collection), notice: 'Carta atualizada com sucesso!'
    else
      render(
        turbo_stream: turbo_stream.replace(
          'cards_form', 
          partial: 'cards/form', 
          locals: { collection: @collection, card: @card }
        )
      )
    end
  end

  def destroy
    @card.destroy
    redirect_to collection_cards_path(@collection), notice: 'Carta removida com sucesso!'
  end

  private

  def set_collection
    @collection = Collection.find(params[:collection_id])
  end

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:question, :awser)
  end
end
