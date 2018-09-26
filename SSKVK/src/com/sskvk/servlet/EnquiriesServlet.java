package com.sskvk.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sskvk.controlller.DAO.EnquiryUtility;

//@WebServlet("/enquiry")
public class EnquiriesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String contactNo = request.getParameter("contactNumber");
		String comments = request.getParameter("comments");

		System.out.println("Name: " + name);
		System.out.println("Email: " + email);
		System.out.println("PhNo: " + contactNo);
		System.out.println("Comments: " + comments);

		if (EnquiryUtility.enquiries(name, email, contactNo,comments)) {
			request.setAttribute("name", name);
			request.setAttribute("email", email);
			request.setAttribute("comment", comments);
			System.out.println("Enquiries successfully inserted");
			// request.getServletContext().getRequestDispatcher("/Main.jsp").forward(request,
			// response);
		}else{
			System.out.println("Unable to insert enquiry");
		}

	}

}
