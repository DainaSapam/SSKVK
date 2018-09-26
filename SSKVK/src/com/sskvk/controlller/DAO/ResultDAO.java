package com.sskvk.controlller.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.sskvk.jdbc.DbConnection;

public class ResultDAO {

	public static boolean getResult(String aNUm){
		
		boolean flag = false;
		Connection con = null;
		String query = "select candidate_name,center_candidate_id,gender,batch_number,"+
		"result from batches where aadhar_number=" +"aNum";
		
		try{
			con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(query);
			System.out.println(ps);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				System.out.println("Name: " + rs.getString("candidate_name"));
				System.out.println("Id: " + rs.getString("center_candidate_id"));
				System.out.println("Aadhar_Number: " + rs.getString("aadhar_number"));
				System.out.println("Gender: " + rs.getString("gender"));
				System.out.println("Batch_Number: " + rs.getString("batch_number"));
				System.out.println("Result: " +rs.getString("result"));
			}
			if(rs.next()){
			     flag = true;
			    }
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			if(con != null){
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
