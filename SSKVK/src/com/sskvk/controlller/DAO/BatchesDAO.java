package com.sskvk.controlller.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.sskvk.jdbc.DbConnection;

public class BatchesDAO {

	public static boolean insertStudentDetails(String name, String id, String aNumber, String gender, 
			String batch, String result){
		boolean flag = false;
		Connection con = null;
		try{
			con = DbConnection.getConnection();
			String query = "INSERT into Batches(candidate_name,center_candidate_id,aadhar_number,gender,batch_number,result) values(?,?,?,?,?,?)";
			
			//insert data using PreparedStatement
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, name);
			ps.setString(2, id);
			ps.setString(3, aNumber);
			ps.setString(4, gender);
			ps.setString(5, batch);
			ps.setString(6, result);
			
			ps.execute();
			flag = true;
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(con != null){
				try{
					con.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
		}
		return flag;
		
	}
}
