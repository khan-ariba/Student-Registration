package com.web;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class FormServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public FormServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());

		HttpSession session = request.getSession();

		String studentName = request.getParameter("studentname");
		String fatherName = request.getParameter("fathername");
		String course = request.getParameter("course");
		String percentage = request.getParameter("percentage");
		String address = request.getParameter("address");
		int id = 0;

		String url = "jdbc:postgresql://localhost:5432/studentregistration";
		String username = "postgres";
		String password = "root";
		String query = "select max(id) from student";

		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			Statement statement = con.createStatement();
			ResultSet res = statement.executeQuery(query);
			res.next();
			id = res.getInt(1) + 1;
		} catch (Exception e) {
			session.setAttribute("connectionError", "<div class=\"alert alert-danger\" role=\"alert\">\r\n"
					+ "<span>Error in connecting to database!</span></div>");
		}

		String insertQuery = String.format(
				"insert into student(id,studentname,fathername,course,percentage,address) values('%s','%s','%s','%s','%s','%s')",
				id, studentName, fatherName, course, percentage, address);

		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			Statement statement = con.createStatement();
			statement.executeUpdate(insertQuery);
			System.out.println("inserted");
			session.setAttribute("connectionError", "");

		} catch (Exception e) {
			System.out.println(e);
		}

		response.sendRedirect("details.jsp");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
