<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="./css/stylesheet.min.css" rel="stylesheet" type="text/css">
<link href="./css/admin.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet" type="text/css">
<link rel="icon" href="./icon.png" type="image/x-icon">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js">
</script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.7.7/xlsx.core.min.js"></script>
<script src="./javascripts/studentDetails.min.js"></script>
<title>Enter Students Details</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row content">
			<div class="col-sm-3 sidenav">
				<h4>Admin's Page</h4>
				<ul class="nav nav-pills nav-stacked">
					<li class="active"><a href="Main.jsp">Home</a></li>
					<li><a href="EnterStudentDetails.jsp">Enter Students
							Details</a></li>
					<li><a href="ListStudents.jsp">Display Students Details</a></li>
					<li><a href="./logout">Logout</a></li>
				</ul>
				<br>
			</div>


			<div class="col-sm-9">
				<hr>
				<h2>Enter Students Details here</h2>
				<div class="panel panel-default">
					<div class="panel-body">
						<form id="detailsForm" method="post" class=" form-horizontal"
							novalidate="novalidate">
							<div class="form-group">
								<label for="name" class="col-sm-4 control-label">Candidate
									Name:</label>
								<div class="col-sm-4">
									<input type="text" class="form-control required-icon"
										name="name" id="name" placeholder="Candidate Name">
								</div>
							</div>
							<div class="form-group">
								<label for="center_id" class="col-sm-4 control-label">Candidate
									Center ID:</label>
								<div class="col-sm-4">
									<input type="text" class="form-control required-icon" name="id"
										id="id" placeholder="Candidate Center ID">
								</div>
							</div>
							<div class="form-group">
								<label for="aadhar" class="col-sm-4 control-label">Aadhar
									Number:</label>
								<div class="col-sm-4">
									<input type="text" class="form-control required-icon"
										name="aadhar" id="aadhar" placeholder="Aadhar Number">
								</div>
							</div>
							<div class="form-group">
								<label for="gender" class="col-sm-4 control-label">Gender:</label>
								<div class="col-sm-4">
									<select name="gender" class="required-icon">
										<option value="" selected>Please select a gender</option>
										<option value="Male">Male</option>
										<option value="Female">Female</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="batch" class="col-sm-4 control-label">Batch
									Number:</label>
								<div class="col-sm-4">
									<select name="batch" class="required-icon">
										<option value="" selected>Please select the Batch</option>
										<option value="Batch 1">Batch 1</option>
										<option value="Batch 2">Batch 2</option>
										<option value="Batch 3">Batch 3</option>
										<option value="Batch 4">Batch 4</option>
										<option value="Batch 5">Batch 5</option>
										<option value="Batch 6">Batch 6</option>
										<option value="Batch 7">Batch 7</option>
										<option value="Batch 8">Batch 8</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="result" class="col-sm-4 control-label">Result:</label>
								<div class="col-sm-4" class="required-icon">
									<select name="result">
										<option value="" selected class="required">Please
											select a Grade</option>
										<option value="Grade A">Grade A</option>
										<option value="Grade B">Grade B</option>
										<option value="Grade D">Grade D</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-4 col-sm-3">
									<button type="submit" class="btn btn-primary" id="save"
										value="Submit">Save</button>
									<button type="reset" class="btn btn-primary" value="Reset">Reset</button>
								</div>
							</div>
						</form>
						<div id="message"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<footer id="foot" class="text-center">
		<a class="up-arrow" href="#myPage" data-toggle="tooltip"
			title="TO TOP"> <span class="glyphicon glyphicon-chevron-up"></span>
		</a><br> <br>
		<div class="rows">
			<div class="col-sm-6">Copyright &copy; 2018, Imphal, Manipur</div>
			<div class="col-sm-6 text-right">Designed and Developed By TON
				&amp; BOI-e SOLUTION.</div>
		</div>
	</footer>
</body>
</html>