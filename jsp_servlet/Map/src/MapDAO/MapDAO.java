package MapDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import MapDTO.MapVO;

public class MapDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	MapVO vo = null;
	
	public void getConn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524";
			String dbid = "cgi_7_6_1216";
			String dbpw = "smhrd6";

			conn = DriverManager.getConnection(url, dbid, dbpw);

		} catch (ClassNotFoundException|SQLException  e) {
			e.printStackTrace();
			System.out.println("con문제");
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

	public ArrayList<MapVO> MapData() {
		ArrayList<MapVO> arr = new ArrayList<MapVO>();
		int cnt = 0;
		try {
			getConn();
			String sql = "select * from t_map";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				String map_seq = rs.getString(1);
				String map_name = rs.getString(2);
				String map_latitude = rs.getString(3);
				String map_longtitude = rs.getString(4);
				String map_type = rs.getString(5);
				String map_stars = rs.getString(6);
				String map_info = rs.getString(7);
				String map_addr = rs.getString(8);
				
				vo = new MapVO(map_seq, map_name, map_latitude, map_longtitude, map_type, map_stars, map_info, map_addr);
				arr.add(vo);
				
				
//				if(cnt>5) {
//					break;
//				}
//				cnt++;
			}
		} catch (Exception e) {
			System.out.println("클래스파일 로딩실패");
			e.printStackTrace();
		} finally {
			close();
		}
		return arr;
	}




}
