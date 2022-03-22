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
		// client가 가지고 있는 cookie 가져와서 확인하기
		Cookie[] cookies = request.getCookies();
		
		for(int i = 0 ; i<cookies.length ; i++){
			// 쿠키의 이름 꺼내기
			String cookieName = cookies[i].getName();
			System.out.print(cookieName);
			// 쿠키의 값 꺼내기
			String cookieValue = cookies[i].getValue();
			System.out.println(" - " + cookieValue);
			
			
			
			
		}
	
	
	%> 
</body>
</html>