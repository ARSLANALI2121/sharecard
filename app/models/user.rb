class User < ApplicationRecord
	has_secure_password
	validates :email, presence: true
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	#validates_inclusion_of :news_letter, :in => [true, false]
	validates :user_name, presence: true
	validates :company, presence: true
	validates :user_name, uniqueness: true
	#validates_uniqueness_of :first_name, scope: [:last_name, :phone_number]

	before_create { generate_token(:auth_token) }

	def generate_token(column)
		begin
			self[column] = SecureRandom.urlsafe_base64
		end while User.exists?(column => self[column])
	end
end