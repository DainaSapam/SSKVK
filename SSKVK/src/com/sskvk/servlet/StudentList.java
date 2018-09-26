package com.sskvk.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sskvk.controller.Batches;
import com.sskvk.controlller.DAO.ListStudents;

//@WebServlet("/student")
public class StudentList extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ArrayList<Batches> list = ListStudents.retrieveStudentDetails();
		
		if(list != null){
			request.setAttribute("students", list);
			request.getServletContext().getRequestDispatcher("/ListStudents.jsp").forward(request, response);
		}
		else{
			request.setAttribute("errMsg", "List is null");
			request.getRequestDispatcher("/ListStudents.jsp").forward(request, response);
		}
	}
	
}
