class User < ApplicationRecord
	has_secure_password
	validates :email, presence: true
	validates_uniqueness_of :first_name, scope: [:last_name, :phone_number]
end