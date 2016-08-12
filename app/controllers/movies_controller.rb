class MoviesController < ApplicationController
<<<<<<< HEAD
  before_action :require_signin, except: [:index, :show]
  before_action :require_admin, except: [:index, :show]
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movies = Movie.send(movies_scope)    
    @genres = Genre.all
  end

  def show
    @fans = @movie.fans
    @genres = @movie.genres

    if current_user
      @current_favorite = current_user.favorites.find_by(movie_id: @movie.id)
    end
  end

  def edit
  end

  def update
=======
  def index
    @movies = Movie.released
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
>>>>>>> 96de389ec1526b170b51680e81306b21b04dcdd1
    if @movie.update(movie_params)
      redirect_to @movie, notice: "Movie successfully updated!"
    else
      render :edit
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to @movie, notice: "Movie successfully created!"
    else
      render :new
    end
  end

  def destroy
<<<<<<< HEAD
=======
    @movie = Movie.find(params[:id])
>>>>>>> 96de389ec1526b170b51680e81306b21b04dcdd1
    @movie.destroy
    redirect_to movies_url, alert: "Movie successfully deleted!"
  end

private

  def movie_params
    params.require(:movie).
<<<<<<< HEAD
      permit(:title, :description, :rating, :released_on, :total_gross, :cast, :director, :duration, :image_file_name, genre_ids: [])
  end

  def movies_scope
    if params[:scope].in? %w(hits flops upcoming recent)
      params[:scope]
    else
      :released
    end
  end

  def set_movie
    @movie = Movie.find_by!(slug: params[:id])
=======
      permit(:title, :description, :rating, :released_on, :total_gross, :cast, :director, :duration, :image_file_name)
>>>>>>> 96de389ec1526b170b51680e81306b21b04dcdd1
  end
end
