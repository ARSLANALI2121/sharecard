module SessionsHelper
	def log_in(user)
		session[:user_id] = user.id
	  end
	  def logged_in?
		#current_user?
		current_user?
	  end
	 def current_user?(user)
		user && user == current_user
	  end
end
