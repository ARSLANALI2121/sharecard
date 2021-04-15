class User < ApplicationRecord
	has_secure_password
	# validates :user_name, presence: true, length: {minimum:3, maximum: 10 }
	# validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/ }, presence: true
	# validates :last_name, :first_name, :phone_number, :company, :news_letter, presence: true
	before_create :confirmation_token
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

	after_save :generate_code

	def generate_code
		unless self.code
		 self.code = SecureRandom.hex
		 self.save!
		end	
	end

	enum role: [:member, :admin]
	after_initialize do 
	  if self.new_record?
		self.role ||= :member
	  end
	end
	def email_activate
		self.email_confirmed = true
		self.confirm_token = nil
		save!(:validate => false)
	end
	private
	def confirmation_token
		if self.confirm_token.blank?
			self.confirm_token = SecureRandom.urlsafe_base64.to_s
			end
		end
end