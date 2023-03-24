<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student details</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Student Registration Form</a> <a
				class="btn btn-sm btn-primary"
				href="/Student_Registration/index.jsp">Add student details</a>
		</div>
	</nav>

	<div class="my-4 mx-2 px-4 " style="width: 20rem;">
		${connectionError}</div>

	<div class="m-2 px-5 py-3">
		<%
		try {
			String url = "jdbc:postgresql://localhost:5432/studentregistration";
			String username = "postgres";
			String password = "root";
			String query = "select * from student";
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			Statement statement = con.createStatement();
			ResultSet res = statement.executeQuery(query);
		%>
		<h3 class="mb-2">Student details</h3>
		<table class="table table-bordered table-hover mt-4 text-center"
			style="width: 66rem;">
			<thead>
				<tr>
					<th scope="col">S. No.</th>
					<th scope="col">Student name</th>
					<th scope="col">Father's name</th>
					<th scope="col">Course</th>
					<th scope="col">Marks in 12(%)</th>
					<th scope="col">Address</th>
				</tr>
			</thead>
			<tbody>
				<%
				while (res.next()) {
				%>
				<tr>
					<td><%=res.getInt(1)%></td>
					<td><%=res.getString(2)%></td>
					<td><%=res.getString(3)%></td>
					<td><%=res.getString(4)%></td>
					<td><%=res.getInt(5)%></td>
					<td><%=res.getString(6)%></td>
				</tr>
				<%
				}
				session.setAttribute("connectionError", "");

				} catch (Exception e) {
				session.setAttribute("connectionError", "<div class=\"alert alert-danger\" role=\"alert\">\r\n"
						+ "<span>Error in connecting to database!</span></div>");

				}
				%>
			</tbody>
		</table>
	</div>


</body>
</html>