package com.sskvk.controlller.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;

import com.sskvk.jdbc.DbConnection;

public class EnquiryUtility {

	public static boolean enquiries(String name, String email, String phNo, String comment) {

		boolean flag = false;
		Connection con = null;
		String queries = "INSERT into enquiry(name,email,contact_number,comment,date_time) values(?,?,?,?,?)";

		try {

			con = DbConnection.getConnection();

			PreparedStatement ps = con.prepareStatement(queries);
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, phNo);
			ps.setString(4, comment);
			ps.setTimestamp(5, getCurrentTime());

			ps.execute();
			
			flag = true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return flag;
	}
	
	private static java.sql.Timestamp getCurrentTime() {
	    Date today = new java.util.Date();
	    return new java.sql.Timestamp(today.getTime());
	}

}
