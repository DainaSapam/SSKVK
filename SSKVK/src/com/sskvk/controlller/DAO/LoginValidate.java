package com.sskvk.controlller.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.sskvk.jdbc.DbConnection;

public class LoginValidate {

	public static boolean validateUserLogin(String uname, String pwd) {
		boolean flag = false;
		Connection con = null;
		try {
			con = DbConnection.getConnection();
			if (con != null) {
				Statement stat = con.createStatement();
				String qry = "SELECT * FROM public.user WHERE username = '"
						+ uname + "' AND password = '" + pwd + "'";
				ResultSet rs = stat.executeQuery(qry);
				if (rs.next()) {
					flag = true;
				}
			}
		} catch (Exception e) {
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

}
