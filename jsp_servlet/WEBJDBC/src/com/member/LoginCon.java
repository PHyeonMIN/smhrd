package com.member;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginCon")
public class LoginCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		// JDBC
		// 1. orcle에서 제공하는 DB와 연결할 수 있는 lib import(WEB-INF->lib)
		// 2. oracle lib파일에서 DB와 연결해주는 class을 실행
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@127.0.0.1:1521";
			String dbid = "hr";
			String dbpw = "hr";
			conn = DriverManager.getConnection(url, dbid, dbpw);

			String sql = "select * from member_web where id=? and pw=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);

			rs = psmt.executeQuery();

			// 7. 명령 후 처리
			if (rs.next()) {
				String uid = rs.getString("id");

				// 세션에 담으려면 Servlet에서는 객체 생성
				// jsp에선 Session은 내장객체로 이미 선언 -> 객체x

				// 세션에 값을 담기
				session.setAttribute("id", uid);
			} else {
			}

		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("클래스파일 로딩실패");
			e.printStackTrace();
		} finally {
			System.out.println("무조건 실행");
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
			} catch (SQLException e) {
				e.printStackTrace();
			}
			response.sendRedirect("Main.jsp");
		}

	}

}
