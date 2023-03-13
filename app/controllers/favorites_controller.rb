class FavoritesController < ApplicationController
  before_action :set_collection

  def create
    Favorite.create(
      user: current_user,
      collection: @collection
    )

    render(
      turbo_stream: turbo_stream.replace(
        @collection,
        partial: 'collections/collection', 
        locals: { collection: @collection }
      )
    )
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy

    redirect_back(fallback_location: root_path)
  end

  private

  def set_collection
    @collection = Collection.find(params[:collection_id])
  end
end
