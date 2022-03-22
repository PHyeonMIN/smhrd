package com.message.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.message.DTO.memberDTO;

public class memberDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	int cnt = 0;
	memberDTO dto = null;
	
	public void getConn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@127.0.0.1:1521";
			String dbid = "hr";
			String dbpw = "hr";

			conn = DriverManager.getConnection(url, dbid, dbpw);

		} catch (ClassNotFoundException|SQLException  e) {
			e.printStackTrace();
		}

		
	}

	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int Join(memberDTO dto) {
		
		

		try {
			getConn();
			
			String sql = "insert into member_message values (?,?,?,?,sysdate)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getEmail());
			psmt.setString(2, dto.getPw());
			psmt.setString(3, dto.getTel());
			psmt.setString(4, dto.getAddress());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();

		}
		return cnt;
	}

	public int Delete(String email) {
		try {
			getConn();
			String sql = "delete from member_Message where email = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, email);
			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();

		}
		return cnt;
	}

	public int Update(memberDTO dto) {
		try {
			getConn();

			String sql = "update member_Message set pw=?, tel=?, address=? where email=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getPw());
			psmt.setString(2, dto.getTel());
			psmt.setString(3, dto.getAddress());
			psmt.setString(4, dto.getEmail());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("클래스파일 로딩실패");
			e.printStackTrace();
		} finally {
			close();

		}
		return cnt;
	}

	public memberDTO Login(memberDTO dto1) {
		try {
			getConn();
			String sql = "select * from member_message where email=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto1.getEmail());
			rs = psmt.executeQuery();

			if (rs.next()) {
				String getemail = rs.getString(1);
				String getPw = rs.getString(2);
				String gettel = rs.getString(3);
				String getaddress = rs.getString(4);

				if (dto1.getPw().equals(getPw)) {
					dto = new memberDTO(dto1.getEmail(), gettel, getaddress);
				}
			}

		} catch (SQLException e) {
			System.out.println("클래스파일 로딩실패");
			e.printStackTrace();
		} finally {
			close();

		}
		return dto;
	}

	public ArrayList<memberDTO> selectMember() {
		ArrayList<memberDTO> arr = new ArrayList<memberDTO>();
		
		try {
			getConn();
			String sql = "select * from member_message";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				String uemail = rs.getString(1);
				String utel = rs.getString(3);
				String uaddr = rs.getString(4);
				
				dto = new memberDTO(uemail, utel, uaddr);
				arr.add(dto);
			}
		} catch (Exception e) {
			System.out.println("클래스파일 로딩실패");
			e.printStackTrace();
		} finally {
			close();
		}
		return arr;
	}

	public boolean CheckCon(String email) {
		boolean check = false;
		try {
			getConn();
			
			String sql = "select * from member_message where email=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, email);
			
			rs = psmt.executeQuery();
			check = rs.next();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();

		}
		return check;
	}
	
	public ArrayList<memberDTO> searchMember(String text) {
		ArrayList<memberDTO> list = new ArrayList<memberDTO>();
		
	
		try {
			getConn();
			String sql = "select * from member_message where email like ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, "%"+text+"%");
			
			rs = psmt.executeQuery();
			while(rs.next()) {
				String uemail = rs.getString(1);
				String utel = rs.getString(3);
				String uaddr = rs.getString(4);
				dto = new memberDTO(uemail, utel, uaddr);
				list.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();

		}
		return list;
	}

}
