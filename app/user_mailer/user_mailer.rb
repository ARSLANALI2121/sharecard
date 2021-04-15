class UserMailer < ApplicationMailer
	default from: 'noreply@sharecard.com'
	def registration_confirmation(user)
		@user = user
		mail(to: @user.email, subject: "Please confirm your registration #{user.first_name}")
	end
end
