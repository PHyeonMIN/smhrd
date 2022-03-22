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
		//jsp에서 session사용해서 MemberVo를 저장해보자
	MemberVO vo1 = new MemberVO("pbk", "1234", "호두아빠", "박병관");
	MemberVO vo2 = new MemberVO("phm", "456", "박", "박현민");
	MemberVO vo3 = new MemberVO("nyh", "89", "예", "예호선생님");
	MemberVO vo4 = new MemberVO("nyh", "89", "예", "예호선생님");
	MemberVO vo5 = new MemberVO("nyh", "89", "예", "예호선생님");
	
	ArrayList<MemberVO> list = new ArrayList<MemberVO>();
	list.add(vo1);
	list.add(vo2);
	list.add(vo3);
	list.add(vo4);
	list.add(vo5);
	//jsp에서는 session객체를 생성할 필요가 x (내장객체로 존재)
	session.setAttribute("info", list);
	response.sendRedirect("getSession.jsp");
	%>
</body>
</html>