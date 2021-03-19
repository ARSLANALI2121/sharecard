class SessionsController < ApplicationController
#   before_action :logged_in_require, only: [:new, :create]
  layout 'application'
  def new

	end

	def create
		#byebug
		user = User.find_by(user_name: params[:session][:user_name])
		if user && user.authenticate(params[:session][:password])
			# if params[:remember_me]
			# 	cookies.permanent[:auth_token] = user.auth_token
			# else
			# 	cookies[:auth_token] = user.auth_token
			# end
			session[:user_id] = user.id
			flash[:success] = " You have successfully logged in"
			redirect_to '/welcome'
			#redirect_to users_path
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