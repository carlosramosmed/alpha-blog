class SessionsController < ApplicationController

  def new
  end

  def create
    email = params[:session][:email].downcase
    user = user = User.find_by(email: email)
    password = params[:session][:password]
    if (user && user.authenticate(password))
      session[:user_id] = user.id
      flash[:notice] = "Logged in successfully!"
      redirect_to user
    else
      flash.now[:alert] = "Incorrect email or password"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out!"
    redirect_to root_path
  end

end