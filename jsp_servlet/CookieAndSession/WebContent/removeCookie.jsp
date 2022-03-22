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
		// 쿠키삭제하기
	// 사실 아직까지 쿠키를 삭제하는 코드는 존재하지 않는다
	// 하지만 우회해서 삭제하는 방법은 존재한다!
	// 동일한 이름의 쿠키를 만들어서 덮어씌우게 되는 순간 새로운 쿠키로 변경이 된다.
	// 그때! (동일한 이름의) 새로운 쿠키를 만들때 나이를 0살로 제한다.
	// 문제 - id라는 이름의 쿠키를 삭제하시오
	
	// 문자열제한, 갯수 제한 , 보안 취약
	Cookie cookie = new Cookie("id","");
	cookie.setMaxAge(0);
	response.addCookie(cookie);
	
	
	
//	Cookie[] cookies = request.getCookies();
//	for (int i = 0; i < cookies.length; i++) {
//		// 쿠키의 이름 꺼내기
//		String cookieName = cookies[i].getName();
//
//		if (cookieName.equals("id")) {
//			cookies[i].setMaxAge(0);
//			response.addCookie(cookies[i]);
//		}
//	}
	
	
	%>
</body>
</html>