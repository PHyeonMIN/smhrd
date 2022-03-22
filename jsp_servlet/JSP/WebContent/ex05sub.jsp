<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<h1>여기는 Sub page 입니다.</h1>
	</header>
	
	<a href="ex05main.jsp">main페이지로 이동</a>
	
	<!-- HTML 주석 -->
	<%-- JSP 주석 --%>
	<%-- JSP > Servlet으로 변환될때, JSP주석은 사라진다.
		그래서 결과페이지에서 html주석은 노출되지만, jsp주석은 보여지지 않는다. --%>
	
	
	<%@ include file = "ex05footer.jsp"   %>
</body>
</html>