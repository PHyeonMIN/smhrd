<%@page import="com.commentDAO.commentDAO"%>
<%@page import="com.memberDTO.tm_memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

	<!-- 현재 접속한 아이디를 작성자 아이디로 -->
	<%
		tm_memberDTO memberdto = (tm_memberDTO) session.getAttribute("dto");
	commentDAO commentdao = new commentDAO();
	%>

	<!-- 클릭한 게시글 번호   tb_seq -->
	<input id="commContent" type="textarea">
	<button id="sendTail" onclick="sendTail()">작성</button>
	<div id="mb_id"><%=memberdto.getMb_id()%></div>
	<hr>
	<div id="tailList"></div>

	<script type="text/javascript" src="assets/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		function sendTail() {
			$.ajax({

				url : "commentCon",
				type : "get",
				data : {
					"commContent" : $('#commContent').val(),
					"mb_id" : $('#mb_id').text()
				},
				dataType : 'json',
				success : function(res) {
					console.log(res);
					console.log(res[0].mb_id);
					console.log(res[0].comm_content);
					$('#mb_id').html(res[0].mb_id);
					$('#tailList').html(res[0].comm_content);

				},
				error : function() {

				}

			})
		}
	</script>






</body>
</html>