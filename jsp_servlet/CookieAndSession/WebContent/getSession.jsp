<%@page import="java.util.ArrayList"%>
<%@page import="com.MemberVO"%>
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
		// session에 저장되어있는 info정보를 꺼내서 확인
	// 웹페이지에 info정보를 하나씩꺼내보세요
	// 아이디, 비밀번호, 닉네임, 이름
	ArrayList<MemberVO> info =  (ArrayList<MemberVO>)session.getAttribute("info");
	
	%>

	<%=info.get(1).getId()%>
	<%=info.get(1).getPw()%>
	<%=info.get(1).getNick()%>
	<%=info.get(1).getName()%>
</body>
</html>