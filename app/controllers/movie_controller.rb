class MovieController < ApplicationController
end

def search
  @movies = Movie.where()
  render "index"
end
