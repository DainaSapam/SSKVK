<%@page import="java.sql.*"%>
<%@page import="com.sskvk.jdbc.DbConnection"%>
<%@ page language="java" contentType="text/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="./css/stylesheet.css" rel="stylesheet" type="text/css">
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
<title>Students</title>
</head>
<body>

	<!-- <div class="container"> -->
	<!-- <div class="row content">
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
			</div> -->

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
				<li><a href="Main.jsp">HOME</a></li>
				<li><a href="./logout">Logout</a></li>
			</ul>
		</div>
	</div>
	</nav>
	<div class="container text-center">
		<div class="row content">
			<h2>Students Details</h2>
			<hr>
			<table class="table table-responsive">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Candidate Name</th>
						<th scope="col">Center Number</th>
						<th scope="col">Aadhar Number</th>
						<th scope="col">Gender</th>
						<th scope="col">Batch</th>
						<th scope="col">Result</th>
						<th scope="col">Update</th>
					</tr>
				</thead>
				<tbody>
					<%
						//ArrayList<Batches> result = ListStudents.retrieveStudentDetails();
						//Batches batch = new Batches();
						/* if(result!=null){
						out.println("Test: "+result);}
						else{out.println("NUll");} */

						Connection con = null;

						String query = "Select * from batches";

						try {
							con = DbConnection.getConnection();
							PreparedStatement ps = con.prepareStatement(query);
							System.out.println(ps);
							ResultSet rs = ps.executeQuery();
							int i = 1;

							while (rs.next()) {
								if (i % 2 == 0) {
					%>

					<%-- <%
						for(int i=0; i <result.size();i++) {
							out.println(result.get(i).getAadharNuumber());
					%> --%>
					<tr class="success">
						<td scope="row"><%=i%></td>
						<td><%=rs.getString("candidate_name")%></td>
						<td><%=rs.getString("center_candidate_id")%></td>
						<td><%=rs.getString("aadhar_number")%></td>
						<td><%=rs.getString("gender")%></td>
						<td><%=rs.getString("batch_number")%></td>
						<td><%=rs.getString("result")%></td>
						<td>
							<a href="EnterStudentDetails.jsp?aadhar=<%=rs.getString("aadhar_number")%>">
							<img src="./images/edit-notes.png" width="30px" height="30px"></img>
							</a>
						</td>
					</tr>

					<%
						} else {
					%>
					<tr>
						<td scope="row"><%=i%></td>
						<td><%=rs.getString("candidate_name")%></td>
						<td><%=rs.getString("center_candidate_id")%></td>
						<td><%=rs.getString("aadhar_number")%></td>
						<td><%=rs.getString("gender")%></td>
						<td><%=rs.getString("batch_number")%></td>
						<td><%=rs.getString("result")%></td>
						<td><a href="EnterStudentDetails.jsp"><img
								src="./images/edit-notes.png" width="30px" height="30px"></img></a></td>
					</tr>
					<%
						}
								i++;
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
				
			</table>
		</div>
	</div>
	<!-- Footer -->
	<footer class="text-center"> <a class="up-arrow"
		href="#myPage" data-toggle="tooltip" title="TO TOP"> <span
		class="glyphicon glyphicon-chevron-up"></span>
	</a> <br>
	<br>
	<div class="rows">
		<div class="col-sm-6">Copyright &copy; 2018, Imphal, Manipur</div>
		<div class="col-sm-6 text-right">Designed and Developed By TON
			&amp; BOI-e SOLUTION.</div>
	</div>
	</footer>
</body>
</html>