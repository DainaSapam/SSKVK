<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Result</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="./css/stylesheet.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet" type="text/css">
<link rel="icon" href="icon.png" type="image/x-icon">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js">
	
</script>
<script src="./javascripts/result.min.js"></script>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar"
	data-offset="50">
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<!--<a class="navbar-brand" href="#myPage">Logo</a>-->
				<img src="logo.jpg" width="100" height="50">
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="home.html">HOME</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div id="result" class="container">
		<div class="row">
			<div class="col-sm-8 col-sm-offset-2">
				<div class="page-header">
					<div class="text-center alert alert-info" role="alert">
						<h5>Please Enter your Aadhar Number to Check Your Result:</h5>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-body">
						<form id="resultForm" method="get" class=" form-horizontal"
							action="result.jsp" novalidate="novalidate">
							<div class="form-group">
								<label for="aadhar" class="col-sm-4 control-label">Aadhar
									Number:</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" name="aadharNumber"
										id="aadharNumber" placeholder="Aadhar Number">

								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-4 col-sm-9">
									<button type="submit" class="btn" value="Submit">Submit</button>
									<button type="reset" class="btn" value="Reset">Reset</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="resultExam" class="container"></div>

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