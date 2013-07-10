class MoviesController < ApplicationController
  # GET
  # /movies/search
  # movies_search path
  def search
    if params[:movie].nil?
    else
      @movies = Imdb::Search.new(params[:movie]).movies
    end
      render "index"
  end

  # GET favorites
  def favorites
    render "index"
  end

  # Post
  # /
  def add_favorite
    movie = Movie.find(params[:id])
    redirect_to movies
  end
end


