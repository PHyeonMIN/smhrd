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
	
@WebServlet("/Joincon")
public class Joincon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String nick = request.getParameter("nick");

		Connection conn = null;
		PreparedStatement psmt = null;
		// JDBC
		// 1. orcle에서 제공하는 DB와 연결할 수 있는 lib import(WEB-INF->lib)
		// 2. oracle lib파일에서 DB와 연결해주는 class을 실행
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("클래스파일 로딩완료");

			// 3.DB에서 사용하는 id/pw를 인증
			String url = "jdbc:oracle:thin:@127.0.0.1:1521";
			String dbid = "hr";
			String dbpw = "hr";

			conn = DriverManager.getConnection(url, dbid, dbpw);
			if (conn != null) {
				System.out.println("연결성공");
			} else {
				System.out.println("연결실패");
			}

			// 5. SQL명령문을 준비
			String sql = "insert into member_web values (?,?,?,sysdate)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			psmt.setString(3, nick);

			// 6. SQL명령문 실행
			int cnt = psmt.executeUpdate();

			// 7. 명령 후 처리
			if (cnt > 0) {
				response.sendRedirect("Main.html");
			}

		} catch (ClassNotFoundException | SQLException e) {
			System.out.println("클래스파일 로딩실패");
			e.printStackTrace();
		} finally {
			System.out.println("무조건 실행");
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

		// Java 2가지 오류
		// 컴파일 오류 : 문법적인 오류
		// 런타임 오류 : 실행을 해야지만 알 수 있는 오류(file, network, DB .. )
		// 예외처리문(try~catch)

	}

}
