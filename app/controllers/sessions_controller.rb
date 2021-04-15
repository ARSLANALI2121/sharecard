class SessionsController < ApplicationController
#   before_action :logged_in_require, only: [:new, :create]
  
  def new

	end

	def create
		# byebug
		user = User.find_by(email: params[:session][:email])
		if user && user.authenticate(params[:session][:password])
			if user.email_confirmed
				session[:user_id] = user.id
				flash[:success] = " You have successfully logged in"
				redirect_to edit_user_path(user)
			else
				flash[:error] = "Please activate your account. "
			end
		else
			flash.now[:error] = " There was something wrong with your information"
			redirect_to '/users/new'
		end
	end
	def welcome
	end

	def destroy
		session[:user_id] = nil
		flash[:success] = "You are successfully Logged out"
		redirect_to login_path
	end
	private
	def logged_in_require
		if logged_in?
			flash[:error] = "You are already logged in"
			redirect_to root_path
		end
	end
end