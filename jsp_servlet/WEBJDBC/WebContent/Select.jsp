<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
	
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		
			String url = "jdbc:oracle:thin:@127.0.0.1:1521";
			String dbid = "hr";
			String dbpw = "hr";

			conn = DriverManager.getConnection(url, dbid, dbpw);

			
			String sql = "select * from member_web where id=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
	

			rs = psmt.executeQuery();
						//executeUpdate() : DB의 내용에 변경이 일어나는 경우, insert,delete,update
			//					리턴을 int로 해준다. 몇행이 성공했는지
			// executeQuery() : select문 사용시 ResultSet으로 리턴한다
			

			
			if (rs.next()) {
				//rs.getString() 이용해서 하나의 열을 가져올 수 있다.
				
					String uid = rs.getString("id");
					String unick = rs.getString("nick");
					String insert_date = rs.getString(4);
				// out 객체를 사용해서 출력
				// PrintWriter 객체생성 x
				out.print("<table border='1'><tr>");
				out.print("<td>"+uid+"</td><td>"+unick+"</td><td>"+insert_date+"</td>");
				out.print("</table></tr>");
			}else{
				System.out.println("검색 실패");
			}

		} catch (Exception e) {
			System.out.println("클래스파일 로딩실패");
			e.printStackTrace();
		} finally {
			System.out.println("무조건 실행");
			try {
				if(rs != null){
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
	
	
	
	
	
	%>
</body>
</html>