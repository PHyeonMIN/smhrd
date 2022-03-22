package com.member;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateCon")
public class UpdateCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 가급적으로 페이지와 인코딩방식 맞춰주기
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String select = request.getParameter("select");
		String data = request.getParameter("data");

		Connection conn = null;
		PreparedStatement psmt = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@127.0.0.1:1521";
			String dbid = "hr";
			String dbpw = "hr";
			conn = DriverManager.getConnection(url, dbid, dbpw);
			String sql ="";
			if (select.equals("pw")) {
				 sql = "update member_web set pw = ? where id = ?";

			} else if (select.contentEquals("nick")) {
				 sql = "update member_web set nick = ? where id = ?";

			}
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, data);
			psmt.setString(2, id);
			int cnt = psmt.executeUpdate();

			if (cnt > 0) {
				response.sendRedirect("Main.html");
			}

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (psmt != null) {
					psmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

}
