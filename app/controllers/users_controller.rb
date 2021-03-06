class UsersController < ApplicationController
  before_action :require_signin, except: [:new, :create]
  before_action :require_correct_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find_by!(username: params[:id])
    @reviews = @user.reviews
    @favorite_movies = @user.favorite_movies
  end

  def new
    @user = User.new
  end

  def create
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "Account successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "Account successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    redirect_to root_url, alert: "Account successfully deleted!"
  end
end



private

def user_params
params.require(:user).
  permit(:name, :email, :username, :password, :password_confirmation)
end

def require_correct_user
  @user = User.find_by!(username: params[:id])
  unless current_user?(@user)
    redirect_to root_url
  end
end
