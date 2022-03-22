<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	tr{
		height: 40px;
		text-align: center;
	}
	table{
		margin: 0 auto;
	}
</style>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
		// 내장객체 : JSP가 Servlet으로 변환될 때 개발자가 많이 사용하는 객체를 자동으로 선언
		String name = request.getParameter("name");
		int java = Integer.parseInt(request.getParameter("java"));
		int web = Integer.parseInt(request.getParameter("web"));
		int android = Integer.parseInt(request.getParameter("android"));
		int iot = Integer.parseInt(request.getParameter("iot"));
		float avg = (java+web+iot+android)/4;
		String score = "";
		if(avg>=95){
			score = "A+";
		}
		else if(avg>=85){
			score = "A";
		}
		else if(avg>=80){
			score = "B+";
		}
		else if(avg>=70){
			score = "C";
		}
		else{
			score="F";
		}
	%>
	<fieldset>
			<legend>성적확인프로그램</legend>
			<table width="500">	
				<tr>
					<td>이름</td>
					<td><%=name%></td>
				</tr>
				<tr>
					<td>JAVA점수</td>
					<td><%=java%></td>
				</tr>
				<tr>
					<td>WEB점수</td>
					<td><%=web%></td>
				</tr>
					<tr>
					<td>IOT점수</td>
					<td><%=iot%></td>
				</tr>		
				<tr>
					<td>ANDROID점수</td>
					<td><%=android%></td>
				</tr>		
				<tr>
					<td>평균</td>
					<td><%=avg %></td>
				</tr>
				<tr>
					<td>학점</td>
					<td><h2><%=score%></h2></td>
				</tr>																											
			</table>
		</fieldset>
</body>
</html>