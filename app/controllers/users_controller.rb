class UsersController < ApplicationController
	def new
		@user = User.new
	end
	def index
	end
	def create
		
		@user= User.new(user_params)
		if @user.save
			#session[:user_id] = @user.id
			format.html { redirect_to @user, notice: "User was successfully created." }
			format.json { render :show, status: :created, location: @user }
			#redirect_to '/welcome'
		else
			render 'new'
		end
	end
	def show
		@user = User.find(params[:id])
	end
	private 
	def user_params
		params.require(:user).permit(:user_name, :first_name, :last_name, :email, :check_box, :password_confirmation, :password, :phone_number, :company)
	end
end