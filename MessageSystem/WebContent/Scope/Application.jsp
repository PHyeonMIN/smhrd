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
		//application : 모두가 공유하는 공간, 서버정지시 초기화 / ex) 홈페이지 방문자수 체크할때 사용
		//session : 유저 개인의 방
	
	
		//Application : 모든 서버 공간에서 사용가능
		int cnt = 0;
		
		if(application.getAttribute("visit")==null){
			
			application.setAttribute("visit", 1);
		}else{
			int visit = (int)application.getAttribute("visit");
			cnt=visit;
			application.setAttribute("visit", visit+1);
		}
	
	%>
	<%=cnt %>
</body>
</html>