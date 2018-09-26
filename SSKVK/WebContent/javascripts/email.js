$(document).ready(function(){
	
	$("#emailForm").submit(function(e){
		
		e.preventDefault();
		var name = $("#name").val();
		var email = $("#email").val();
		var contactNumber = $("#phNo").val();
		var comment = $("#comments").val();
		
		if(name.length == ""){
			e.preventDefault();
			console.log("Name not validated");
			$("#name").after('<span class="error">Please Enter Your Name</span>');
			$("#name").focus();
		}else{
			console.log("Name validated");
		}
		
		if(contactNumber == ""){
			e.preventDefault();
			$("#phNo").after('<span class="error">Please Enter Your Contact Number</span>');
		}else if(contactNumber.length > 10 ){
			e.preventDefault();
			$("#phNo").after('<span class="error">Contact Number should be of 10 digits</span>');
		}else{
			validateContactNumber(contactNumber);
		}
		
		if($.trim(email).length == 0){
			e.preventDefault();
			$("#email").after('<span class="error">Please Enter Your Email</span>');
			$("#email").focus();
			//e.preventDefault();
		}else if(validateEmail(email)){
			console.log("Email Validated");
		}else{
			e.preventDefault();
			$("#email").after('<span class="error">Invalid Email Address</span>');
			$("#email").focus();
			//e.preventDefault();
		}
		
		if(comment.length == ""){
			e.preventDefault();
			$("#comments").after('<span class="error">Please Give your Valuable Comments</span>');
			$("#comments").focus();
			//e.preventDefault();
		}
		
		console.log("name: "+name+"\n email: "+email+"\n contactNo: "+contactNumber+"\n comments: "+comment);
		if((name.length != 0) && (email.length != 0) && (contactNumber.length != 0) && (comment.length != 0)){
			var input = {name: name, email: email, contactNumber: contactNumber, comments: comment};
			console.log("name: "+name+"\n email: "+email+"\n contactNo: "+contactNumber+"\n comments: "+comment);
		
		$.ajax({
			cache: 'false',
			url: "./enquiry",
			type: 'POST',
			data: input,
			success: function(data){
				$("#message").html('Your enquiriry has been sent successfully');
				$('#message').fadeOut(3000);
				$("#emailForm").each(function(){
					this.reset();
				});
			}
		});}
		//return true;
	});
	
	function validateEmail(sEmail){
		var filter = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		if (filter.test(sEmail)) {
			return true;
		}else {
			return false;}
	}
	
	/*function validateName(name){		
		if(name.length !== ""){
			$("#name").after('<span class="error">Please Enter Your Name</span>');
			$("#name").focus();
			return false;
		}
	}*/
	
	function validateContactNumber(number){
		
		var regex = /^[0]?[789]\d{9}$/;

		if(regex.test(number)){
			return true;
		}else {
			return false;
		}
	}
	
});