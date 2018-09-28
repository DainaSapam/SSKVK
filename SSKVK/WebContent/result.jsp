<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="com.sskvk.jdbc.DbConnection"%>
<!DOCTYPE html>
<html>
<head>
<title>Result</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="./css/stylesheet.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet" type="text/css">
<link rel="icon" href="icon.png" type="image/x-icon">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js">
	
</script>
<script src="./javascripts/result.js"></script>
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

				<table class="table">
					<thead>
						<tr>
							<th>Aadhar Number</th>
							<th class="text-center" scope="col">Name</th>
							<th class="text-center" scope="col">Center Number</th>
							<th class="text-center" scope="col">Gender</th>
							<th class="text-center" scope="col">Batch</th>
							<th class="text-center" scope="col">Result</th>
						</tr>
					</thead>
					<tbody>
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
								while (rs.next()) {
									if (!rs.getString("result").contains("Grade D")) {
										System.out.println("grade D");
						%>
						<tr class="success">
							<td class="text-center"><%=rs.getString("aadhar_number")%></td>
							<td class="text-center"><%=rs.getString("candidate_name")%></td>
							<td class="text-center"><%=rs.getString("center_candidate_id")%></td>
							<td class="text-center"><%=rs.getString("gender")%></td>
							<td class="text-center"><%=rs.getString("batch_number")%></td>
							<td class="text-center"><%=rs.getString("result")%></td>
						</tr>
						<%
							} else { %>
							
						<tr class="alert alert-danger">
							<td scope="row"></td>
							<td scope="row"></td>
							<td scope="row">No Record Found</td>
							<td scope="row"></td>
							<td scope="row"></td>
							<td scope="row"></td>
						</tr>	
							
								<%
							}
									System.out.println(rs.getString("aadhar_number"));
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
					</tbody>
				</table>
				<div class="text-center">
					<a href="result.html">Back</a>
				</div>
			</div>
		</div>
	</div>

	<footer id="foot" class="text-center">
		<div class="rows">
			<div class="col-sm-6">Copyright &copy; 2018, Imphal, Manipur</div>
			<div class="col-sm-6 text-right">Designed and Developed By TON
				& BOI-e SOLUTION.</div>
		</div>
	</footer>
</body>
</html>