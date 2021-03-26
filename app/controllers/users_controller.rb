class UsersController < ApplicationController
	def new
		@user = User.new
	end
	def index
		
	end
	def create
		#byebug
		@user= User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			flash[:success]= "User was successfully created."
			# format.html { redirect_to @user, notice: "User was successfully created." }
			# format.json { render :show, status: :created, location: @user }
			redirect_to login_path
		else
			flash[:errors] = "User was Not created. Please Check Your Information"
			render 'new'
		end
	end
	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:success]= "User was successfully Updated."
			else
				flash[:error]= "Their is an Error is this information."
			end
		end
	def delete_image
		image = ActiveStorage::Attachment.find(params[:image_id])
		if current_user == image.record
			image.purge
			redirect_back(fallback_location: request.referer)
		else
			redirect_to root_path, notice: " Hello Your Image is Deleted"
		end
	end
	def show
		@user = User.find(params[:id])
	end
	def edit
		@user = User.find(params[:id])
	end
	private 
	def user_params
		params.require(:user).permit(:user_name, :first_name, :last_name, :email, :password_confirmation, :password, :phone_number, :company, :profile_image)
	end
end
