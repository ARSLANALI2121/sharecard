# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create([
	{
		user_name: 'Ali123',
		first_name: 'ali',
		last_name: 'adnan',
		email: 'ali123@example.com',
		phone_number: '12331234',
		company: 'Software Company',
		password: '12345',
		password_confirmation: '12345',
	},
	{
		user_name: 'Adnan123',
		first_name: 'adnan ',
		last_name: 'yasir',
		email: 'adnan123@example.com',
		phone_number: '03001223123',
		company: 'Software Company',
		password: '12345',
		password_confirmation: '12345',
	},
	{
		user_name: 'Yasir123',
		first_name: 'Yasir ',
		last_name: 'ali',
		email: 'yasir13@example.com',
		phone_number: '03001223123',
		company: 'Software Company',
		password: '12345',
		password_confirmation: '12345',
	}
])