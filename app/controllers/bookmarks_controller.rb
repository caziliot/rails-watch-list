class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @movies = Movie.all
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @movie = Movie.find(movie_params[:movie])
    @bookmark.list = @list
    @bookmark.movie = @movie
    if @bookmark.save
      flash[:notice] = 'bookmark created successfully'
    else
      flash[:error] = @bookmark.errors.full_messages.first
    end
    redirect_to list_path(@list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end

  def movie_params
    params.require(:bookmark).permit(:movie)
  end
end
