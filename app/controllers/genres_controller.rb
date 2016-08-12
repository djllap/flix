class GenresController < ApplicationController
  def show
    @genre = Genre.find_by!(slug: params[:id])
    @movies = @genre.movies
  end
end
