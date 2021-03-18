class ApplicationController < ActionController::Base
	#include SessionsHelper
	helper_method :current_user, :logged_in?

	def current_user
		if session[:user_id]
		 @current_user ||= User.find(session[:user_id])
		#  if cookies[:auth_token]
		#  @current_user ||= User.find_by_auth_token(cookies[:auth_token])
		 else
			@current_user = nil
		 end
	end

	def logged_in?
		!!current_user
	end

	# def require_user
	# 	if !logged_in?
	# 		flash[:error] = "You must be the logged in to perform that action "
	# 		redirect_to login_path
	# 	end
	# end
end
