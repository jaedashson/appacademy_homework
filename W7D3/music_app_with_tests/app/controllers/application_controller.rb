class ApplicationController < ActionController::Base

  helper_method :current_user
  helper_method :logged_in?
  
  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?(user)
    session[:session_token] == user.session_token
  end

  def login!(user)
    user.try(:reset_session_token!)
    session[:session_token] = user.session_token
  end

  def logout!
    current_user.try(:reset_session_token!)
    session[:session_token] = nil
  end


end
