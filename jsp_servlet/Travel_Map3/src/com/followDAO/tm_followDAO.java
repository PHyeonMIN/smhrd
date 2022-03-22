package com.followDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.followDTO.tm_followDTO;
import com.memberDTO.tm_memberDTO;

public class tm_followDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

	tm_memberDTO dto = null;
	tm_followDTO follow_dto = null;

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

	public ArrayList<String> followCheck(tm_memberDTO dto) {

		String mb_id = dto.getMb_id();
		String mb_follow = Integer.toString(dto.getMb_follow());
		String mb_follower = Integer.toString(dto.getMb_follower());

		ArrayList<String> list = new ArrayList<String>();

		list.add(mb_id);
		list.add(mb_follow);
		list.add(mb_follower);

		return list;

	}

	public int follow(tm_followDTO dto) {

		getConn();

		try {
			String sql = "INSERT INTO t_follow(f_id,f_date,mb_id) VALUES(?,sysdate,?) ";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getF_id());
			psmt.setString(2, dto.getMb_id());

			rs = psmt.executeQuery();
			if (rs.next()) {
			} else {
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return cnt;
	}

	public ArrayList<tm_memberDTO> searchMember(String search_id) {

		getConn();

		ArrayList<tm_memberDTO> arr = new ArrayList<tm_memberDTO>();

		try {
			if (conn != null) {
			} else {
			}

			String sql = "SELECT * FROM t_member WHERE mb_id like ? ";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, "%" + search_id + "%");

			rs = psmt.executeQuery();

			while (rs.next() == true) {
				String mb_id = rs.getString("mb_id");
				int mb_follow = Integer.parseInt(rs.getString("mb_follow"));
				int mb_follower = Integer.parseInt(rs.getString("mb_follower"));

				dto = new tm_memberDTO(mb_id, mb_follow, mb_follower);
				arr.add(dto);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return arr;

	}

	public int Join(String mb_id) {
		getConn();

		try {
			String sql1 = "INSERT INTO t_follow(f_seq,f_date,mb_id) VALUES(t_follow_seq.nextval,sysdate,?)";
			psmt = conn.prepareStatement(sql1);
			psmt.setString(1, mb_id);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		close();

		return cnt;

	}
}
