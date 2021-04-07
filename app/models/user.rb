class User < ApplicationRecord
	has_secure_password
	# validates :user_name, presence: true, length: {minimum:3, maximum: 10 }
	# validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/ }, presence: true
	# validates :last_name, :first_name, :phone_number, :company, :news_letter, presence: true
	
	validates :profile_photo, content_type: [:png, :jpg, :jpeg]
	has_one_attached :profile_photo
	# , dependent: :destroy do |attachable|
		# attachable.variant :thumb, resize: "100x100"
	#   end
	#   def profile_image_url
	# 	if self.profile_image.attachment
	# 	  self.profile_image.attachment.service_url
	# 	end
	#   end
	# class User
	# 	self.page: 4

end