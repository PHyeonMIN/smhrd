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
		int td = Integer.parseInt(request.getParameter("td"));
		int tr = Integer.parseInt(request.getParameter("tr"));
	%>
	<table border="1">
	<h1><%=tr %>개의 tr</h1>
	<h1><%=td %>개의 td</h1>
		<%
		for(int i =0; i<tr; i++){
			out.print("<tr>");
			for(int j=1;j<=td;j++){
				out.print("<td>"+j+"</td>");
			}
			out.print("</tr>");
		}
		%>
	</table>
</body>
</html>