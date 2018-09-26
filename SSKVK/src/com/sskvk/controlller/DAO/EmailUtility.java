package com.sskvk.controlller.DAO;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailUtility {
	
	public static void sendEmail(String host, String port, final String userName,
			final String password, String fromAddress, String name, String message) 
	throws AddressException, MessagingException {
		
		// sets SMTP server properties
		Properties properties = new Properties();
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", port);
		properties.put("mail.smtp.user", userName);
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		
		//create a new session with an authenticator
		Authenticator auth = new Authenticator(){
			public PasswordAuthentication getPasswordAuthentication(){
				return new PasswordAuthentication(userName, password);
			}
		};
		
		Session session = Session.getInstance(properties, auth);
		
		//creates a new email message
		Message msg = new MimeMessage(session);
		
		msg.setFrom(new InternetAddress(fromAddress));
		InternetAddress[] toAddress = {new InternetAddress(userName)};
		msg.setRecipients(Message.RecipientType.TO, toAddress);
		msg.setSentDate(new Date());
		msg.setText(message);
		
		//send the email
		Transport.send(msg);
	}

}
