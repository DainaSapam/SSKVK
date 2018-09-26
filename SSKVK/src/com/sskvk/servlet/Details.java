package com.sskvk.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sskvk.controlller.DAO.BatchesDAO;

public class Details extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest requset, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	@Override
	protected void doPost(HttpServletRequest requset, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		/*response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");*/
		String candidateName = requset.getParameter("name");
		String id = requset.getParameter("id");
		String aadhar = requset.getParameter("aadhar");
		String gender = requset.getParameter("gender");
		String batch = requset.getParameter("batch");
		String result = requset.getParameter("result");
		
		System.out.println("Inside Details servlet");
		
		System.out.println("Candidate Name: "+candidateName);
		System.out.println("CenterID: "+id);
		System.out.println("Aadhar Number: "+aadhar);
		System.out.println("Gender: "+gender);
		System.out.println("Batch Number: "+batch);
		System.out.println("Result: "+result);
		
		if(BatchesDAO.insertStudentDetails(candidateName, id, aadhar, gender, batch, result)){
			System.out.println("Data successfully inserted into the database");
			response.sendRedirect("EnterStudentDetails.jsp");
		}else{
			System.out.println("Unable to insert the data ");
		}
		
	}
	
	
}
