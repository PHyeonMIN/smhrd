package com.myTravelDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.boardDTO.tm_boardDTO;
import com.myTravelDTO.tm_myTravelDTO;

public class tm_myTravelDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

	tm_myTravelDTO dto = null;
	int cnt = 0;
	boolean check = false;

	public void getConn() {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524";
			String dbid = "cgi_7_6_1216";
			String dbpw = "smhrd6";

			conn = DriverManager.getConnection(url, dbid, dbpw);
			if (conn != null) {
				System.out.println("접속 성공");
			} else {
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}

	}

	public void close() {
		try {
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public int myTravelInsert(tm_myTravelDTO dto) {

		getConn();
		try {
			String sql = "INSERT INTO my_travel_map" //
					+ "(map_seq,travel_memo,travel_character,travel_fileO,travel_fileT,mb_id,travel_order)" //
					+ "VALUES(?,?,?,?,?,?,?)";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getMap_seq());
			psmt.setString(2, dto.getTravel_memo());
			psmt.setString(3, dto.getTravel_character());
			psmt.setString(4, dto.getTravel_fileO());
			psmt.setString(5, dto.getTravel_fileT());
			psmt.setString(6, dto.getMb_id());
			psmt.setInt(7, dto.getTravel_order());

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		close();
		return cnt;
	}
}
