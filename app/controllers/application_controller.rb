class ApplicationController < ActionController::Base
  before_action :current_user

  protect_from_forgery with: :exception

  helper_method :logged_in?

  def current_user
  	@current_user = User.find_by(id: session[:user_id])
  	session[:user_id] = nil unless @current_user.present?
  	@current_user
  end

  def logged_in?
  	current_user != nil
  end
end
