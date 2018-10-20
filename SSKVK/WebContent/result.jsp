<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="com.sskvk.jdbc.DbConnection"%>
<!DOCTYPE html>
<html>
<head>
<title>Result</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="./css/stylesheet.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet" type="text/css">
<link rel="icon" href="icon.png" type="image/x-icon">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js">
	
</script>
<script src="./javascripts/result.min.js"></script>
<script>
	
</script>
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
	<div class="container">
		<div class="row">
			<div class="col-sm-12 ">
			
				<div class="page-header">
					<div class="text-center alert alert-info" role="alert">
						<h5>Field Technician Computing And Peripheral</h5>
					</div>
				</div>


				<%
					String aNUm = request.getParameter("aadharNumber");
					/* if (request.getParameter("a") != null) {
					// 							aNUm = request.getParameter("a");
						//System.out.println("Aadhar Number: "+aNUm);
					} */

					Connection con = null;
					String query = "select * from batches where aadhar_number='" + aNUm
							+ "'";

					try {
						con = DbConnection.getConnection();
						PreparedStatement ps = con.prepareStatement(query);
						System.out.println(ps);
						ResultSet rs = ps.executeQuery();

						if (rs.next()) {
							if (!rs.getString("result").contains("Grade D")) {
				%>
				<table id="result" class="table" style="border: 1px solid black">
					<thead>
						<tr>
							<th class="text-center">Aadhar Number</th>
							<th class="text-center">Name</th>
							<th class="text-center">Center Number</th>
							<th class="text-center">Gender</th>
							<th class="text-center">Batch</th>
							<th class="text-center">Result</th>
						</tr>
					</thead>
					<tbody>
						<tr class="success">
							<td class="text-center"><%=rs.getString("aadhar_number")%></td>
							<td class="text-center"><%=rs.getString("candidate_name")%></td>
							<td class="text-center"><%=rs.getString("center_candidate_id")%></td>
							<td class="text-center"><%=rs.getString("gender")%></td>
							<td class="text-center"><%=rs.getString("batch_number")%></td>
							<td class="text-center"><%=rs.getString("result")%></td>
						</tr>
					</tbody>
				</table>
				<div class="text-center">
					<a href="result.html">Back</a>
				</div>
				<%
					} else {
				%>

				<div class="text-center alert alert-danger">No Record Found</div>
				<div class="text-center">
					<a href="result.html">Back</a>
				</div>
				<%
					}

				} else {
				%>

				<div class="text-center alert alert-danger">You are not a
					student. Please enroll first.</div>
				<div class="text-center">
					<a href="result.html">Back</a>
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
			</div>
		</div>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br>
	</div>
	<br>
	<footer class="text-center">
	<div id="share">
			<a href="http://www.facebook.com/sharer.php?u=https://sskvksingjamei.com" class="fa fa-facebook" target="_blank"></a>
  			<a href="https://twitter.com/share?url=https://sskvksingjamei.com&amp;text=SSKVK,Singjamei;" class="fa fa-twitter" target="_blank"></a>
  			<a href="https://plus.google.com/share?url=https://sskvksingjamei.com" class="fa fa-google-plus" target="_blank"></a>
			<a href="https://web.whatsapp.com/send?text=https://sskvk.singjamei.com" class="fa fa-whatsapp" target="_blank"></a>
		</div>
		<div class="rows">
			<div class="col-sm-6">Copyright &copy; 2018, Imphal, Manipur</div>
			<div class="col-sm-6 text-right">Designed and Developed By TON
				&amp; BOI-e SOLUTION.</div>
				<br>
		</div>
	</footer>
</body>
</html>