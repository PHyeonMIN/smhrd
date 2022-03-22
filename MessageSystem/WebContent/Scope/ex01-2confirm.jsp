<%@page import="com.message.DTO.memberAgeDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	//1. 입력받은 name, age, addr, email의 값을 받아오시오.
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String addr = request.getParameter("addr");
	String email = request.getParameter("email");
	
	if(age>19){
		
		//2. 회원정보를 memberAgeDTO로 정의하시오.(name, age, addr, email)
		memberAgeDTO dto = new memberAgeDTO(name,age,addr,email);
		//3. memberAgeDTO를 request영역에 저장하시오.
		request.setAttribute("dto", dto);
		//4. request를 갖고 ex01-3main.jsp로 이동하시오.
		RequestDispatcher dis = request.getRequestDispatcher("ex01-3main.jsp");
		dis.forward(request, response);
		
		
		// request 사용 : 이동 후 데이터 삭제
		// session 사용 : 세션공간에 계속 존재(따로 삭제해줘야함)
		
		
	}else{
		//5. ex01-1input.html로 이동하시오.
		response.sendRedirect(" ex01-1input.html");
	}
%>
</body>
</html>