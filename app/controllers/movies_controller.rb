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

  # GET
  def show
    @movie = Imdb::Movie.new(params[:id])
  end

  def save
    @movie = Imdb::Movie.new(params[:id])
    movie = Movie.new
    movie.title = @movie.title
    movie.year = @movie.year
    movie.plot = @movie.plot
    movie.mpaa_rating = @movie.mpaa_rating
    movie.rating = 50
    movie.save
    redirect_to saved_path

    actors = @movie.cast_members[0..2]
    actors.each do |actor|
      new_actor = Actor.find_or_create_by_name(actor)

     movie.actors << new_actor
    end
  end

  def saved
    @movies = Movie.all
  end

  # Post
  # /
  def add_favorite
    @movie = Imdb::Movie.new(params[:id])
    movie = Movie.new
    movie.title = @movie.title
    movie.year = @movie.year
    movie.plot = @movie.plot
    movie.mpaa_rating = @movie.mpaa_rating
    movie.rating = 100
    movie.save
    redirect_to saved_path
  end
end




