class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]
	after_action :verify_authorized, only: [:destroy]
	after_action :verify_policy_scoped, only: :index

	def new
		@user = User.new
	end
	def index
		# byebug
		@user = policy_scope(User.all).paginate(page: params[:page], per_page: 7)
		# authorize @user, :index?	
	end
	def create
		#byebug
		@user= User.new(user_params)
		if @user.save
			UserMailer.registration_confirmation(@user).deliver
			# session[:user_id] = @user.id
			flash[:success]= " User was successfully created. Please confirm your email address."
			redirect_to login_path
		else
			flash[:errors] = "User was Not created. Please Check Your Information"
			render 'new'
		end
	end
	def confirm_email
		
		user = User.find_by_confirm_token(params[:id])
		# byebug
			user.email_activate
			flash[:success] = 'Welcome to Share Card App! Your Account has now been confirmed'
			redirect_to login_path
			# else
			# 	flash[:error] = 'Error User does not exist.'
			# 	redirect_to root_url
			# end
		end
	def update
		#byebug
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
		# byebug
		@code = @user.code
		if @code.present?
		@qrcode = RQRCode::QRCode.new("http://localhost:3000/users/3")
			# [:user_name, :email, :last_name, :first_name])
		@svg = @qrcode.as_svg(
			offset: 0,
			color: '000',
			shape_rendering: 'crispEdges',
			module_size: 6
		)

	end
end
	def edit
		# byebug
	end
	def destroy
		@user.destroy
		authorize @user
		redirect_to users_path
	end
	private 
	def set_user
		@user =  User.find(params[:id])
		
	end
	def user_params
		params.require(:user).permit(:user_name, :first_name, :last_name, :email, :password_confirmation, :password, :phone_number, :company, :profile_photo, :social_media, :about_me) 
		# , :confirm_token, :email_confirmed
	end
end
