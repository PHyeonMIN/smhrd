<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	로그인 페이지
	
	<form action="tm_LoginCon" method="post">
		ID :<input type="text" name="id"><br> 
		PW :<input type="password" name="pw"><br> 
			<input type="submit"name="전송">
	</form>
	
	<a href = "tm_Join.jsp"><buttton>회원가입 페이지로 이동</buttton></a>


</body>
</html>