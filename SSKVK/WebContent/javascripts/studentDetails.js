$(document).ready(function(){
	
	$('#detailsForm').submit(function(e){
		
		//alert("Hi");
		
		var name = $("#name").val();
		var id = $("#id").val();
		var aadhar = $("#aadhar").val();
		var gender = $("#gender option:selected").val();
		var batch = $("#batch option:selected").val();
		var result = $("#result option:selected").val();
		
		
		if(name.length == ""){
			$("#name").after('<span class="error">Please Enter Name of the student</span>');
			$("#name").focus();
			e.preventDefault();
		}
		
		if(id.length == ""){
			$("#id").after('<span class="error">Please Enter the center ID</span>');
			$("#id").focus();
			e.preventDefault();
		
		}else if(id.length <15){
			$("#id").after('<span class="error">Center ID should not be less than 15 characters</span>');
			$("#id").focus();
			e.preventDefault();
		}
		
		if(aadhar.length == ""){
			$("#aadhar").after('<span class="error">Please Enter Aadhar Number</span>');
			$("#aadhar").focus();
			e.preventDefault();
		}else if(aadhar.length < 12){
			$("#aadhar").after('<span class="error">Aadhar Number should be of 12 digits</span>');
			$("#aadhar").focus();
			e.preventDefault();
		}else if(aadhar.length > 12){
			$("#aadhar").after('<span class="error">Aadhar Number should not be more than 12 digits</span>');
			$("#aadhar").focus();
			e.preventDefault();
		}
		
		if(gender == ""){
			$("#gender").after('<span class="error">Please select Gender</span>');
			$("#gender").focus();
			e.preventDefault();
		}else{
			return true;
		}
		
		if(batch == ""){
			$("#batch").after('<span class="error">Please select Batch</span>');
			$("#batch").focus();
			e.preventDefault();
		}else{
			return true;
		}
		
		if(result == ""){
			$("#result").after('<span class="error">Please select Result</span>');
			$("#result").focus();
			e.preventDefault();
		}else{
			return true;
		}
		
		var inputJSON = null;
		console.log("name: "+name+"\n id: "+id+"\n aadhar: "+aadhar+"\n gender: "+gender+
				"\n batch: "+batch+"\n result: "+result);
		e.preventDefault();
		if((name !== null || name !== "") && (id !== null || id !== '') && 
				(aadhar !== null || aadhar !== "") && (gender !== null || gender !== "") && 
				(batch !== null || batch !== "") && (result !== null || result !== "")){
			inputJSON = {name: name, id: id, aadhar: aadhar, gender: gender, batch: batch, result: result};
		}
		
		$.ajax({
			cache: 'false',
			url: "./Details",
			type: 'POST',			
			data: inputJSON,			
			success: function(data, xhr){
				
				$('#message').html('<div class="alert alert-success fade in">'
						+'<button type="button" class="close close-alert" data-dismiss="alert" aria-hidden="true">'
						+'×</button>This is a success message</div>');
				$('#message').fadeOut(2000);
			},
			error : function(xhr) {
				console.log("error");
			},
			complete : function(data){
				console.log("complete");
			}
		});
	});
});