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
		// 1. 인코딩
		request.setCharacterEncoding("utf-8");
	
		// 2. 전달받은 데이터를 변수에 담아놓은 것 : 파라미터수집
		// select태그로부터 값을 받아왔음 --> 변수에 담아줘야함
		// request.getParameter() : String 타입으로만 리턴
		String page1 = request.getParameter("page");
		String page2="";
		
		
		// 3. 구분 (.equals("비교"))
		if(page1.equals("네이버")){
			page2="http://www.naver.com";
		}else if(page1.equals("구글")){
			page2 ="http://www.google.com";
		}else if(page1.equals("다음")){
			page2 ="http://www.daum.net";
		}
		
		// 4. sendRedirect 이용해서 각각에 따라서 페이지 이동
		// response 객체의 sendRedirect("이동하고 싶은 주소");
		response.sendRedirect(page2);
		// 요청과 응답이 2번 일어남
		
		
		// sendRedirect()와 같은 페이지이동은 한번만 가능하다
	%>
</body>
</html>