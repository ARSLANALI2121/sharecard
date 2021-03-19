class User < ApplicationRecord
	has_secure_password
	validates :user_name, presence: true, length: {minimum:3, maximum: 10 }
	validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/ }, presence: true
	validates :last_name, :first_name, :phone_number, :company, :news_letter, presence: true

end