class ApplicationController < ActionController::Base
	include Pundit


	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

	protect_from_forgery with: :exception
	helper_method :current_user, :logged_in?
	

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
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
	private
	def user_not_authorized
		flash[:alert] = "Access denied"
		redirect_to(request.referer || root_path )
	end
end
