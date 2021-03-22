$().ready(function(){
	$("#registration").validate({
			rules:{
				"user[user_name]": "required",	
				"user[first_name]": "required",
				"user[last_name]":	"required",
				"user[phone_number]": "required",
				"user[email]": {
					required: true,
					email: true
				},
				"user[password]": {
					required: true,
					minlength: 5
				},
				"user[password_confirmation]":{
					requireed: true, equalTo: "#password"
				}
			},
			messages: {
				first_name: "Please enter your firstname",
				last_name: " Please Enter YOUR Last Name",
				password: {
					required: "Please provide a password",
					minlength: "Your password must be at least 5 characters long"
				},
				email: "`please enter a valid email address"
			},

		});	
});