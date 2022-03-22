<%@page import="com.commentDAO.commentDAO"%>
<%@page import="com.memberDTO.tm_memberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.memberDAO.tm_memberDAO"%>
<%@page import="com.snsDTO.tm_snsDTO"%>
<%@page import="com.snsDAO.tm_snsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>N6_post</title>
<link rel="stylesheet" href="./assets/css/N6_post.css">
</head>
<body>
	<%
		tm_snsDAO snsdao = new tm_snsDAO();
	tm_snsDTO snsdto = new tm_snsDTO();
	tm_memberDAO memberdao = new tm_memberDAO();
	ArrayList<String> imgList = new ArrayList<String>();
	snsdto = (tm_snsDTO) request.getAttribute("dto");
	tm_memberDTO memberdto = (tm_memberDTO) session.getAttribute("dto");
	commentDAO commentdao = new commentDAO();
	//ArrayList<commentDTO> list = commentdao.allComment();
	%>
	<div class="container">
		<div class="item1">
			<div>
				<img src="tm_upload/<%=snsdto.getTb_file()%>">
			</div>
		</div>
		<div class="item2">
			<div class="item3">
				<a href="#" class="profile_img"><img
					src="tm_upload/<%=memberdao.imgMemberSelect(snsdto.getMb_id())%>"></a>
				<a href="tm_selectMember?mb_id=<%=snsdto.getMb_id()%>"
					class="user_nick"><%=snsdto.getMb_id()%></a> 
				<div style="float:right; margin:20px; margin-top:40px;">
					<a href="N_travelplanCon?mb_id=<%=snsdto.getMb_id()%>&t_title=<%=snsdto.getT_title() %>" class="travel_plan">TravelPlan</a>
				</div>
			</div>
			<div class="item4" style="height:10%;"><%=snsdto.getT_title()%>
			</div>
			<div class="item5" style="height:71.8%;">
				<div id="tailList"><%=snsdto.getTb_content()%></div>
			</div>
			<div class="item6" style="height:10%;">
				<button id="likesButton" onclick="likes()">
					<img src="img/heart_tung.png">
				</button>

				<div id="likes" style="align-self: center">
					<%=snsdto.getTb_likes()%></div>
				<button>
					<img src="img/details.png">
				</button>
			</div>
			<!--  <div class="item7">
				<input id="commContent" type="text">
				<button id="sendTail" onclick="sendTail()">댓글달기</button>
			</div>-->
		</div>
	</div>

	<script type="text/javascript" src="assets/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		function likes() {
			$.ajax({
				url : "likesCon",
				type : "post",
				data : {
					"tb_seq" :
	<%=snsdto.getTb_seq()%>
		},
				success : function(res) {
					console.log(res);
					$('#likes').text(res);
				},
				error : function() {
					alert("요청 실패 !");
				},
			})
		}
	</script>



	<script type="text/javascript" src="assets/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		function sendTail() {
			$.ajax({

				url : "commentCon",
				type : "get",
				data : {
					"commContent" : $('#commContent').val(),
					"mb_id" : $('.user_nick').text(),
					"tb_seq" :
	<%=snsdto.getTb_seq()%>
		},
				dataType : 'json',
				success : function(res) {
					console.log(res);
					console.log(res[0].mb_id);
					console.log(res[0].comm_content);
					$('#tailList').append(res[0].mb_id + '  :  ');
					$('#tailList').append(res[0].comm_content);
					$('#tailList').append('<b>');

				},
				error : function() {
					alert("요청 실패!!!")

				}

			})
		}
	</script>

</body>
</html>