$(function(){
	var $myForm = $("new_user");
	if($myForm.length){
		$myForm.validate({
			rules:{
				user_name: "required",	
				first_name: "required",
				last_name:	"required",
				phone_number: "required",
				email: {
					required: true,
					email: true
				},
				password: {
					required: true,
					minlength: 5
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
			}
		})
	}
})