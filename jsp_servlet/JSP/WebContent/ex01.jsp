<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- %@지시자 : JSP가 Servlet로 변환될 때 환경설정해주는 영역 --%>
<!DOCTYPE html>	<%-- %!선언문 --%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%-- 
		JSP(Java Server Page)
			-> 응답하는 페이지를 개발자가 쉽게 만들 수 있게 해주는 서버페이지
		JSP실행되는 과정
			처음실행될 때 : JSP -> Tomcat -> Servlet -> class -> HTML -> 톰캣메모리저장
			두번째 실행될때: JSP -> 톰캣메모리 저장된 class파일을 가져와서 실행
			JSP = Servlet
			
			
	 --%>
	 
	 int num = 10;
	 <%	//스크립틀릿(scriptlet) : JSP에서 Java코드를 구현할 수 있는 영역
	 	int num = 10;
	 	System.out.print(num);
	 %>
	 <style>
	 	b{
	 		font-size:50px;
	 	}
	 </style>
	 <br>
	 num변수안에 들어있는 값 : <b><%=num %></b>
	 <%-- 표현식(expression) : JSP에서 Java변수를 웹브라우저에 출력할 수 있는 영역 --%>

	 
	 <%-- 1~100까지의 합을  웹브라우저에 출력하시오(for) --%>
	 <br>
	 <%
	 	int sum =0;
		for(int i = 1; i<101; i++){
			sum+=i;
		}
	 %>
	 1~100까지의 합 : <b><%=sum %></b>
	 
	 
	 
	 <table border="1">
	 	<tr>
	 		<%-- 아래의 td태그를 10번 반복하시오(for) --%>
	 		<%for(int i=0; i<10; i++){ %>
	 			<td>1</td>
	 		<%} %>
	 	</tr>
	 </table>
	 
	 
	 
	 
	 
	 
</body>
</html>