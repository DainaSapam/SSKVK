package com.sskvk.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sskvk.controlller.DAO.LoginValidate;

public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		System.out.println("Inside Servlet");
		System.out.println("Username: " + username);
		System.out.println("Password: " + password);

		if (LoginValidate.validateUserLogin(username, password)) {
			HttpSession session = request.getSession(true);
			session.setAttribute("user", username);
			System.out.println("Inside if");
			RequestDispatcher rs = request
					.getRequestDispatcher("Main.jsp");
			rs.forward(request, response);
		} else {
			System.out.println("Inside else");
			out.println("Incorrect username and password");
			RequestDispatcher rs = request.getRequestDispatcher("Login.html");
			rs.forward(request, response);
		}
		// doGet(request, response);
	}

}
