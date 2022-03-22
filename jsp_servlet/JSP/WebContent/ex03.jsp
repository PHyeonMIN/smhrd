<%@page import="java.util.Locale"%>
<%@page import="java.util.GregorianCalendar"%>
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
		//out내장객체 : JSP에 스트립틀릿 영역 안에서 브라우저로 출력할 수 있는 객체
		out.print("Hello");
		//Servlet에서 PrintWriter = out 내장 객체
				
		GregorianCalendar cal = new GregorianCalendar(Locale.KOREA);
		
		int year = cal.get(cal.YEAR);
		int month = cal.get(cal.MONTH);
		int date = cal.get(cal.DATE);
		int hour = cal.get(cal.HOUR);
		int min = cal.get(cal.MINUTE);
		int sec = cal.get(cal.SECOND);
		
		out.print("<br>"+year+"년"+(month+1)+"월"+date+"일"+hour+"시"+min+"분"+sec+"초");
	%>
	<br><%=year %>년<%=month+1 %>월<%=date %>일<%=hour %>시<%=min %>분<%=sec %>초
	
	
	 		
	 	
	 		
	 
	
</body>
</html>