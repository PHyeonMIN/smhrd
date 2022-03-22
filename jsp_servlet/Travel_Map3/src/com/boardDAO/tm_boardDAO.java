package com.boardDAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.boardDTO.tm_boardDTO;
import com.snsDTO.tm_snsDTO;

public class tm_boardDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	tm_boardDTO dto = null;

	int cnt = 0;

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

	public ArrayList<tm_boardDTO> boardList() {

		getConn();

		ArrayList<tm_boardDTO> list = new ArrayList<tm_boardDTO>();

		try {
			if (conn != null) {
			} else {
			}

			String sql = "SELECT * FROM t_travel_board ORDER BY tb_seq DESC";
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next() == true) {

				int tb_seq = rs.getInt("tb_seq");
				String tb_title = rs.getString("tb_title");
				String tb_content = rs.getString("tb_content");
				String tb_file = rs.getString("tb_file");
				int tb_cnt = rs.getInt("tb_cnt");
				int tb_likes = rs.getInt("tb_likes");
				int tb_total = rs.getInt("tb_total");
				String tb_open = rs.getString("tb_open");
				String mb_id = rs.getString("mb_id");
				int travel_seq = rs.getInt("travel_seq");

				dto = new tm_boardDTO(tb_seq, tb_title, tb_content, tb_file, tb_cnt, //
						tb_likes, tb_total, tb_open, mb_id, travel_seq);
				list.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	public tm_boardDTO boardDetail(int tb_seq) {

		getConn();

		try {
			String sql = "UPDATE t_travel_board SET tb_cnt = tb_cnt + 1 WHERE tb_seq = ? ";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, tb_seq);

			psmt.executeUpdate();

			sql = "SELECT * FROM t_travel_board WHERE tb_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, tb_seq);
			rs = psmt.executeQuery();
			rs.next();

			int tb_seq1 = rs.getInt("tb_seq");
			String tb_title = rs.getString("tb_title");
			String tb_content = rs.getString("tb_content");
			String tb_file = rs.getString("tb_file");
			int tb_cnt = rs.getInt("tb_cnt");
			String tb_date = rs.getString("tb_date");
			int tb_likes = rs.getInt("tb_likes");
			int tb_total = rs.getInt("tb_total");
			String tb_open = rs.getString("tb_open");
			String mb_id = rs.getString("mb_id");
			int travel_seq = rs.getInt("travel_seq");

			dto = new tm_boardDTO(tb_seq1, tb_title, tb_content, tb_file, tb_cnt, //
					tb_date, tb_likes, tb_total, tb_open, mb_id, travel_seq);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		close();

		return dto;
	}

	public void boardInsert(tm_boardDTO dto) {

		getConn();
		System.out.println(dto.getTb_content() + "DAO 보드 인서트");
		try {
			String sql = "INSERT INTO t_travel_board" //
					+ "(tb_seq,tb_title,tb_content,tb_cnt,tb_date,mb_id,travel_seq)" //
					+ "VALUES(t_travel_board_seq.NEXTVAL,?,?,?,sysdate,?,my_travel_map_seq.CURRVAL)";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getTb_title());
			psmt.setString(2, dto.getTb_content());
			psmt.setInt(3, dto.getTb_cnt());
			psmt.setString(4, dto.getMb_id());
			

			psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		close();
	}
}
