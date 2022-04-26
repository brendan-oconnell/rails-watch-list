class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def create
    @list = List.new(list_params)
    if @list.valid?
      @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def new
    @list = List.new # needed to instantiate the form_for
  end

  def show
    get_list
  end

  private

  def get_list
    @list = List.find(params[:id])
    @bookmarks = Bookmark.where(list_id: params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
