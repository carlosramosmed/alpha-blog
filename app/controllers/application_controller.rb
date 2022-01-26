class ApplicationController < ActionController::Base
  # these methods are available to all controllers!

  #this lone will allow current_user to be used in views as well!!
  helper_method :current_user, :logged_in? 

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end
end
