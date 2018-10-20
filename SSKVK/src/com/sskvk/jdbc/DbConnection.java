package com.sskvk.jdbc;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class DbConnection {
	public static Connection getConnection() {
		System.out.println("Creating postgres DataBase Connection");
		Connection con = null;
		try {
			//Connection from local database
			// Provide database Driver according to your database
			/*Class.forName("org.postgresql.Driver");
			System.out.println("PostgreSQL driver loaded");
			// Provide URL, database and credentials according to your database 
			con = DriverManager.getConnection(
			"jdbc:postgresql://localhost:5432/SSKVK", "postgres", "postgres");*/
			
			//Connection from miles web DB
			Properties prop = new Properties();
			System.out.println("test");
			prop.load(new FileInputStream(System.getProperty("user.home") + "/mydb.cfg"));
			System.out.println("user.home: "+System.getProperty("user.home"));
			String host = prop.getProperty("host").toString().trim();
			String username = prop.getProperty("username").toString().trim();
			String password = prop.getProperty("password").toString().trim();
			String driver = prop.getProperty("driver").toString().trim();
			
			System.out.println("host: " + host + "\nusername: " + username 
					+ "\npassword: " + password + "\ndriver: " + driver);
			
			Class.forName(driver);
	        System.out.println("--------------------------");
	        System.out.println("DRIVER: " + driver);
	        con = DriverManager.getConnection(host, username, password);
	        System.out.println("CONNECTION: " + con);
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());

		}
		if (con != null) {
			System.out.println("Connection created successfully....");
		}
		return con;
	}
}
