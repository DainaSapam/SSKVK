
$(document).ready(function() {

	$("#registerForm").validate({

		rules: {
			email: {
				required: true
			},
			password: {
				required: true
			},
			confirmPassword: {
				required: true,
				equalTo: "#password"
			}
		},
		messages: {
			email: {
				required: "Enter a valid email"
			},
			password: {
				required: "Password field cannot be blank"
			},
			confirmPassword: {
				required: "Confirm Password field cannot be blank",
				equalTo: "Password and Confirm Password should be matched"
			}
		},

		submitHandler: function(form){
			alert("Successfully registered.");
			form.submit();
		}
	});

});

