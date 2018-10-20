<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="com.sskvk.jdbc.DbConnection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="./css/stylesheet.min.css" rel="stylesheet" type="text/css">
<link href="./css/admin.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet" type="text/css">
<link rel="icon" href="./icon.png" type="image/x-icon">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js">
	
</script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/jquery.validate.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.7.7/xlsx.core.min.js"></script>
<title>Main Page</title>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar"
	data-offset="50">
	<!-- <nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#myPage">Logo</a>
				<img src="./logo.jpg" width="100" height="50">
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">SSKVK Singjamei</a></li>
				</ul>
			</div>
		</div>
	</nav> -->

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
				<%
					if (session != null) {
						if (session.getAttribute("user") != null) {
							String name = (String) session.getAttribute("user");
				%>
				<h1>
					<small>You are now logged in as : <b><%=name%></b> <%
 	}
 	}
 %>
					</small>
				</h1>
				<hr>
				<div class="panel panel-primary">
					<div class="panel-heading"><b>Enquiries</b></div>
				</div>

				<%
					Connection con = null;
					String query = "Select * from enquiry";

					try {
						con = DbConnection.getConnection();
						PreparedStatement ps = con.prepareStatement(query);
						System.out.println(ps);
						ResultSet rs = ps.executeQuery();
						int i = 1;

						while (rs.next()) {
				%>

				<div class="panel panel-default">
					<div class="panel-body">
						<b>Name:</b> <%=rs.getString("name")%><br> 
						<b>Email:</b> <%=rs.getString("email")%><br>
						<b>Contact No:</b> <%=rs.getString("contact_number")%><br> 
						<b>Comments:</b> <%=rs.getString("comment")%> <br>
						<b>Date:</b> <%= rs.getTimestamp("date_time") %>
					</div>
				</div>
				<%
					}
					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
						if (con != null) {
							try {
								con.close();
							} catch (SQLException e) {
								e.printStackTrace();
							}
						}
					}
				%>
				<hr>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<footer class="text-center">
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