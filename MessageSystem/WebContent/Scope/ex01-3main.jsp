<%@page import="com.message.DTO.memberAgeDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
	body{
		text-align: center;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>환영합니다!</h1>
	<%
		// 1. ex01-2confirm.jsp에서 넘겨준 memberVO객체를 출력하시오.
		memberAgeDTO dto = (memberAgeDTO)request.getAttribute("dto");
	%>
	이름 :<%=dto.getName() %> <br>
	나이 :<%=dto.getAge() %> <br>
	주소 :<%=dto.getAddr() %> <br>
	이메일 :<%=dto.getEmail() %> <br>
	
	
	
	
	
	
	
	
	
</body>
</html>