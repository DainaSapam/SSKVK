package com.sskvk.servlet;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sskvk.controlller.DAO.EmailUtility;

/**
 * Servlet implementation class EmailServlet
 */
//@WebServlet("/email")
public class EmailServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private String host;
	private String port;
	private String user;
	private String pass;
       
    public void init() {
        // read the SMTP server setting from web.xml file
    	ServletContext context = getServletContext();
    	host = context.getInitParameter("host");
    	port = context.getInitParameter("port");
    	user = context.getInitParameter("user");
    	pass = context.getInitParameter("pass");
    	
    	System.out.println("Host: "+host);
    	System.out.println("Port: "+port);
    	System.out.println("User: "+user);
    	System.out.println("Pass: "+pass);
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// read field forms
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String comments = request.getParameter("comments");
		
		System.out.println("Name: "+name);
		System.out.println("Email: "+email);
		System.out.println("Comments: "+comments);
		
		String resultMessage = "";
		
		try{
			EmailUtility.sendEmail(host, port, user, pass, name, email, comments);
			resultMessage = "Message successfully sent";
		}catch(Exception e){
			e.printStackTrace();
			resultMessage = "There was an error: "+e.getMessage();
		}finally{
			request.setAttribute("Message", resultMessage);
			System.out.println(resultMessage);
			//getServletContext().getRequestDispatcher("/").forward(request, response);
		}
	}

}
