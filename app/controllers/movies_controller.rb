class MoviesController < ApplicationController

  def create
    @movie = Movie.new(movie_params)
    if @movie.valid?
      @movie.save
      redirect_to lists_path
    else
      render :new
    end
  end

  def new
    @movie = Movie.new # needed to instantiate the form_for
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :poster_url)
  end
end
