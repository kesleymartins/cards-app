class CollectionsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_collection, only: %i[ edit update destroy ]

  def index
    @pagy, @collections = pagy(Collection.by_user(current_user).latest)
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
      params.require(:collection).permit(:title, :description)
    end
end
