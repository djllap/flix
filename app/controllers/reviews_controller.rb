class ReviewsController < ApplicationController

  before_action :set_movie
<<<<<<< HEAD
  before_action :require_signin

=======
>>>>>>> 96de389ec1526b170b51680e81306b21b04dcdd1
  def index
    @reviews = @movie.reviews
  end

  def new
    @review = @movie.reviews.new
  end

  def create
    @review = @movie.reviews.new(review_params)
<<<<<<< HEAD
    @review.user = current_user

=======
>>>>>>> 96de389ec1526b170b51680e81306b21b04dcdd1
    if @review.save
      redirect_to movie_reviews_path(@movie),
                notice: "Thanks for your review!"
    else
      render :new
    end
  end

  def destroy
    @review = @movie.reviews.find(params[:id])
    @review.destroy
    redirect_to movie_reviews_path(@movie), notice: "Review successfully deleted."
  end

  def edit
    @review = @movie.reviews.find(params[:id])    
  end

  def update
    @review = @movie.reviews.find(params[:id])
    if @review.update(review_params)
      redirect_to movie_reviews_path(@movie), notice: "Review successfully updated."
    else
      render :new
    end
  end
end


private

def review_params
<<<<<<< HEAD
  params.require(:review).permit(:comment, :stars)
end

def set_movie
  @movie = Movie.find_by!(slug: params[:movie_id])
=======
  params.require(:review).permit(:name, :comment, :stars)
end

def set_movie
  @movie = Movie.find(params[:movie_id])
>>>>>>> 96de389ec1526b170b51680e81306b21b04dcdd1
end