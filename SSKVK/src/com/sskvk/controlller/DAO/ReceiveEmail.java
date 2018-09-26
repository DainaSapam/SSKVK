package com.sskvk.controlller.DAO;

import java.io.IOException;
import java.security.NoSuchProviderException;
import java.util.Properties;

import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Store;

public class ReceiveEmail {
	
	public static void receiveEmail(String hostVal, String mailStrProt, String port, final String userName,
			final String password, String fromAddress, String name, String message)
					throws NoSuchProviderException, MessagingException, IOException{
		 Properties properties = new Properties();
		 properties.put("mail.pop3.host", hostVal);
		 properties.put("mail.pop3.port", mailStrProt);
		 properties.put("mail.pop3.ssl.enable", "true");
		 properties.put("mail.pop3.starttls.enable", "true");
		 properties.put("mail.pop3.starttls.require", "true");
		 
		 Session emailSessionObj = Session.getDefaultInstance(properties);
		 
		//Create POP3 store object and connect with the server
	      Store storeObj = emailSessionObj.getStore("pop3s");
	      storeObj.connect(hostVal, userName, password);
	      
	      //Create folder object and open it in read-only mode
	      Folder emailFolderObj = storeObj.getFolder("INBOX");
	      emailFolderObj.open(Folder.READ_ONLY);
	      
	      //Fetch messages from the folder and print in a loop
	      Message[] messageobjs = emailFolderObj.getMessages(); 
	      
	      for (int i = 0, n = messageobjs.length; i < n; i++) {
	          Message indvidualmsg = messageobjs[i];
	          System.out.println("Printing individual messages");
	          System.out.println("No# " + (i + 1));
	          System.out.println("Email Subject: " + indvidualmsg.getSubject());
	          System.out.println("Sender: " + indvidualmsg.getFrom()[0]);
	          System.out.println("Content: " + indvidualmsg.getContent().toString());
	      }
	      emailFolderObj.close(false);
	      storeObj.close();
	}

}
