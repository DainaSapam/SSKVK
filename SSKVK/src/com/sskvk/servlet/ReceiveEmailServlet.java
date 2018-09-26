package com.sskvk.servlet;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sskvk.controlller.DAO.ReceiveEmail;

//@WebServlet("/receiveEmail")
public class ReceiveEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private String hostVal;
	private String mailStrProt;
	private String user;
	private String pass;
       
    public void init() {
        // read the SMTP server setting from web.xml file
    	ServletContext context = getServletContext();
    	//host = context.getInitParameter("host");
    	//port = context.getInitParameter("port");
    	hostVal = context.getInitParameter("hostVal");
    	mailStrProt = context.getInitParameter("mailStrProt");
    	user = context.getInitParameter("user");
    	pass = context.getInitParameter("pass");
    	
    	//System.out.println("Host: "+host);
    	//System.out.println("Port: "+port);
    	System.out.println("HostVal: "+hostVal);
    	System.out.println("MailStrProt: "+mailStrProt);
    	System.out.println("User: "+user);
    	System.out.println("Pass: "+pass);
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// read field forms
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				String comments = request.getParameter("comments");
				
				System.out.println("Name: "+name);
				System.out.println("Email: "+email);
				System.out.println("Comments: "+comments);
				
				String resultMessage = "";
				
				try{
					ReceiveEmail.receiveEmail(hostVal, mailStrProt, resultMessage, user, pass, email, name, comments);
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
