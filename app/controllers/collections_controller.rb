class CollectionsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_collection, only: %i[ edit update destroy ]

  def public
    @collections = Collection.includes([:user, :cards]).only_public.latest

    @pagy, @collections = pagy(@collections)
  end

  def favorites
    @collections = Collection.includes([:user, :cards]).latest
    
    @pagy, @collections = pagy(@collections)
  end

  def owned
    @collections = Collection.includes([:user, :cards]).owned_by(current_user).latest
    
    @pagy, @collections = pagy(@collections)
  end

  def new
    @collection = Collection.new
  end

  def edit; end

  def create
    @collection = Collection.new(collection_params)
    @collection.user = current_user
    
    if @collection.save
      redirect_to collections_path, notice: "Coleção criada com sucesso!"
    else
      render(
        turbo_stream: turbo_stream.replace(
          'collections_form', 
          partial: 'collections/form', 
          locals: { collection: @collection }
        )
      )
    end
  end

  def update
    if @collection.update(collection_params)
      redirect_to collections_path, notice: "Collection atualizada com sucesso!"
    else
      render(
        turbo_stream: turbo_stream.replace(
          'collections_form', 
          partial: 'collections/form', 
          locals: { collection: @collection }
        )
      )
    end
  end

  def destroy
    @collection.destroy
    redirect_to collections_url, notice: "Collection removida com sucesso!."
  end

  private
    def set_collection
      @collection = Collection.find(params[:id])
    end

    def collection_params
      params.require(:collection).permit(:title, :description, :privacy)
    end
end
