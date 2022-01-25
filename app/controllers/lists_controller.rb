class ListsController < ApplicationController
  def index
    @lists = List.all

  end

  def show
    @list = List.find(params[:id])
    @movies = Movie.all
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(lists_params)
    @list.save
    redirect_to root_path
  end

  private

  def lists_params
    params.require(:list).permit(:name, :image_url)
  end
end
