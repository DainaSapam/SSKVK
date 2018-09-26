
$(document).ready(function() {

	$("#loginform").validate({

		rules: {
			email: {
				required: true
			},
			password: {
				required: true
			}
		},
		messages: {
			email: {
				required: "Enter a valid email"
			},
			password: {
				required: "Password field cannot be blank"
			}
		},

		submitHandler: function(form){
			alert("Successfully login.");
			form().submit();			
		}
	});

});

