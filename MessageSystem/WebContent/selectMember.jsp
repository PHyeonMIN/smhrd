<%@page import="java.util.ArrayList"%>
<%@page import="com.message.DAO.memberDAO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.message.DTO.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Forty by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		
	</head>
	<style>
	
	</style>
	<body style="text-align: center;">
	<%
		request.setCharacterEncoding("utf-8");
		
	%>
		<!-- Wrapper -->
			<div id="wrapper">
				<!-- Menu -->
					<nav id="Update">	
						<table>
							<caption><h2>회원관리페이지</h2></caption>
							<thead>
								<tr>
									<td colsapn="2"><input type="text" name="email" placeholder="검색어를 입력하세요."></td>
									<td><button type="button" onClick="memberSearch()">검색</button></td>
								</tr>
								<tr>
									<td>Email</td>
									<td>HP</td>
									<td>Addr</td>						
								</tr>
							</thead>
							<tbody id="tbody">
								<%
									memberDAO dao = new memberDAO();
									ArrayList<memberDTO> arr =dao.selectMember();
									for(int i=0; i<arr.size(); i++){
										out.print("<tr>");
										out.print("<td>" + arr.get(i).getEmail() + "</td>");
										out.print("<td>" + arr.get(i).getTel() + "</td>");
										out.print("<td>" + arr.get(i).getAddress() + "</td>");
										out.print("<td><a href='DeleteCon.do?delete_email=" + arr.get(i).getEmail() + "'>삭제</a></td>");
										out.print("</tr>");
									}
								%>
							</tbody>
						</table>
					</nav>			
			</div>
		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets/js/main.js"></script>
			<script>
				function memberSearch(){
					$.ajax({
						url : "searchMember.do",
						type : "get",	
						data : {
							"email" : $('input[name=email]').val()
						},
						dataType : 'json',
						success : function(res){ 
							console.log(res)
							$('#tbody').html('');
							let table ='';
							for(let i = 0; i<res.length; i++){
								table +='<tr>';
								table +='<td>'+ res[i].email +'</td>';
								table +='<td>'+ res[i].tel +'</td>';
								table +='<td>'+ res[i].address +'</td>';
								table +="<td><a href='DeleteCon.do?delete_email=" + res[i].email + "'>삭제</a></td>";
								table +='</tr>';
							}
							$('#tbody').append(table)
						},
						error : function(){
							alert("요청 실패!")
						}
					
					
					
					
					})
				}
			
			</script>
	</body>
</html>

