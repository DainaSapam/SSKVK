package com.sskvk.controlller.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.sskvk.controller.Batches;
import com.sskvk.jdbc.DbConnection;

public class ListStudents {

	public static ArrayList<Batches> retrieveStudentDetails() {

		ArrayList<Batches> students = new ArrayList<Batches>();
		Batches batches = new Batches();
		Connection con = null;

		String query = "Select * from batches";

		try {
			con = DbConnection.getConnection();
			PreparedStatement ps = con.prepareStatement(query);
			System.out.println(ps);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				batches.setCandidateName(rs.getString("candidate_name"));
				batches.setCenterID(rs.getString("center_candidate_id"));
				batches.setAadharNuumber(rs.getString("aadhar_number"));
				batches.setGender(rs.getString("gender"));
				batches.setBatchNumber(rs.getString("batch_number"));
				batches.setResult(rs.getString("result"));

				students.add(batches);

				System.out.println("Name: " + batches.getCandidateName());
				System.out.println("Id: " + batches.getCenterID());
				System.out.println("Aadhar_Number: " + batches.getAadharNuumber());
				System.out.println("Gender: " + batches.getGender());
				System.out.println("Batch_Number: " + batches.getBatchNumber());
				System.out.println("Result: " + batches.getResult());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(con != null){
			    try {
			     con.close();
			    } catch (SQLException e) {
			     e.printStackTrace();
			    }
			   }
		}
		return students;
	}
}
