<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Registration Form</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand" href="">Student Registration Form</a> <a
				class="btn btn-sm btn-primary"
				href="/Student_Registration/details.jsp">Got to student details</a>
		</div>
	</nav>
	<div class="my-4 mx-1 " style="width: 20rem; float: right;">
		${connectionError}</div>

	<div class="mt-5 mx-3 px-5 py-3">
		<h3 class="mb-2">Enter student details</h3>
		<form class="mt-4" action="FormServlet" method="post" name="form"
			style="width: 66rem;">
			<div class="mb-3 row">
				<label class="col-sm-2 col-form-label">Student Name:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="studentname" required>
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2 col-form-label">Father's Name:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="fathername" required>
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2 col-form-label">Course:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="course" required>
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2 col-form-label">Class XII percentage:</label>
				<div class="col-sm-5">
					<input type="number" class="form-control" name="percentage"
						required>
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2 col-form-label">Address:</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" name="address" required>
				</div>
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>
</body>
</html>