class CollectionsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_collection, only: %i[ edit update destroy ]

  def public
    @query = Collection.ransack(params[:query])
    @collections = @query.result.publics(current_user)
    @pagy, @collections = pagy(@collections.includes([:user, :cards]))
    
    @ransack_path = public_collections_path
    render 'index'
  end

  def favorites
    @query = Collection.ransack(params[:query])
    @collections = @query.result.favorited_by(current_user)
    @pagy, @collections = pagy(@collections.includes([:user, :cards]))

    @ransack_path = favorite_collections_path
    render 'index'
  end

  def owned
    @query = Collection.ransack(params[:query])
    @collections = @query.result.owned_by(current_user)
    @pagy, @collections = pagy(@collections.includes([:user, :cards]))
    
    @ransack_path = owned_collections_path
    render 'index'
  end

  def new
    @collection = Collection.new
  end

  def edit
    authorize @collection
  end

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
    authorize @collection

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
    authorize @collection
    
    @collection.destroy
    redirect_to collections_url, notice: "Collection removida com sucesso!."
  end

  private
    def set_collection
      @collection = Collection.find(params[:id])
    end

    def collection_params
      params.require(:collection).permit(:title, :description, :privacy, :language)
    end
end
