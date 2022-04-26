class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new # needed to instantiate the form_for
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    # we need `restaurant_id` to associate review with corresponding restaurant
    @list = List.find(params[:list_id])
    # @movie = Movie.find(params[:movie_id])
    @bookmark.list_id = @list.id
    @bookmark.movie_id = params[:bookmark][:movie_id]
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @list = List.find(@bookmark.list_id)
    @bookmark.destroy
    redirect_to list_path(@list)
  end


  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
