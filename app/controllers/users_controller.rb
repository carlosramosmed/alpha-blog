class UsersController < ApplicationController
  before_action :find_user, only: %i[show edit update]

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def show
    @articles = @user.articles
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to AlphaBlog, #{@user.username}, you have successfully signed up!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Account updated!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end