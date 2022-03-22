package com.memberDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpSession;

import com.memberDTO.tm_memberDTO;

public class tm_memberDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

	tm_memberDTO dto = null;

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

	public int Join(tm_memberDTO dto) {

		getConn();

		try {
			String sql = "INSERT INTO t_member VALUES(?,?,?,?,?,?,?,?,?,?,?,sysdate,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getMb_id());
			psmt.setString(2, dto.getMb_pw());
			psmt.setString(3, dto.getMb_name());
			psmt.setInt(4, dto.getMb_age());
			psmt.setString(5, dto.getMb_gender());
			psmt.setString(6, dto.getMb_email());
			psmt.setString(7, dto.getMb_addr());
			psmt.setString(8, dto.getMb_img());
			psmt.setString(9, dto.getMb_nickname());
			psmt.setInt(10, dto.getMb_follow());
			psmt.setInt(11, dto.getMb_follower());
			psmt.setString(12, dto.getAdmin_yn());

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		close();
		return cnt;

	}

	public tm_memberDTO Login(tm_memberDTO dto) {

		getConn();

		tm_memberDTO sessiondto = null;

		try {
			String sql = "SELECT * FROM t_member WHERE mb_id = ? and mb_pw = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getMb_id());
			psmt.setString(2, dto.getMb_pw());
			rs = psmt.executeQuery();

			if (rs.next()) {
				String session_id = rs.getString("mb_id");
				String session_pw = rs.getString("mb_pw");
				String session_name = rs.getString("mb_name");
				int session_age = rs.getInt("mb_age");
				String session_gender = rs.getString("mb_gender");
				String session_email = rs.getString("mb_email");
				String session_addr = rs.getString("mb_addr");
				String session_img = rs.getString("mb_img");
				String session_nickname = rs.getString("mb_nickname");
				int session_follow = rs.getInt("mb_follow");
				int session_follower = rs.getInt("mb_follower");
				String session_joindate = rs.getString("mb_joindate");
				String session_admin_yn = rs.getString("admin_yn");

				sessiondto = new tm_memberDTO(session_id, session_pw, session_name, session_age, session_gender,
						session_email, session_addr, session_img, session_nickname, session_follow, session_follower,
						session_joindate, session_admin_yn);
			} else {
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		close();

		return sessiondto;
	}

	public boolean Check(String id) {

		getConn();
		try {
			String sql = "SELECT * FROM t_member WHERE mb_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);

			rs = psmt.executeQuery();
			if (rs.next()) {
				check = true;
			} else {
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return check;
	}
	public void followIncrease(String mb_id) {

		getConn();

		try {
			String sql = "UPDATE t_member SET mb_follow = mb_follow+1 WHERE mb_id = ? ";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, mb_id);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}

		close();

	}

	public void followerIncrease(String f_id) {

		getConn();

		try {
			String sql = "UPDATE t_member SET mb_follower = mb_follower+1 WHERE mb_id = ? ";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, f_id);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}

		close();

	}

}
