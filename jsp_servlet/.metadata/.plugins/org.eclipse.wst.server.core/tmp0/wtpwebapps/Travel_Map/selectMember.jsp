<%@page import="com.followDTO.tm_followDTO"%>
<%@page import="com.followDAO.tm_followDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.snsDAO.tm_snsDAO"%>
<%@page import="com.memberDTO.tm_memberDTO"%>
<%@page import="com.snsDTO.tm_snsDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container {
	overflow: hidden;
	margin: 0 auto;
	display: flex;
	flex-flow: row wrap;
	justify-content: flex-start;
	align-items: flex-start;
	align-content: flex-start;
}

.item {
	float: left;
	padding: 3px;
	margin: 3px;
	width: 77px;
	height: 77px;
	object-fit: cover;
}

.info {
	float: left;
	padding: 3px;
	margin: 3px;
	width: 200px;
	height: 200px;
	object-fit: cover;
	clear: both;
}
</style>
</head>
<body>

	<%
		tm_memberDTO opdto = (tm_memberDTO) session.getAttribute("opdto");
	tm_memberDTO dto = (tm_memberDTO) session.getAttribute("dto");

	tm_snsDAO dao = new tm_snsDAO();
	ArrayList<tm_snsDTO> list = dao.searchMy(opdto.getMb_id());
	request.setAttribute("list", list);

	tm_followDTO follow_dto = new tm_followDTO(opdto.getMb_id(), dto.getMb_id());
	tm_followDAO follow_dao = new tm_followDAO();

	boolean check = follow_dao.checkFollow(follow_dto);
	%>

	<div class="container">
		<div id="mb_id">
			아이디 :
			<%=opdto.getMb_id()%></div>
		<div>
			닉네임 :
			<%=opdto.getMb_nickname()%></div>

		<div>팔로우 :</div>
		<div id="mb_follow">
			<%=opdto.getMb_follow()%></div>
		<div>팔로워 :</div>
		<div id="mb_follower">
			<%=opdto.getMb_follower()%></div>
		<div>
			<img class="item" src="tm_upload/<%=opdto.getMb_img()%>">
		</div>
		<%
			if (check == true) {
		%>
		<button id="followButton" onclick="follow('<%=opdto.getMb_id()%>')">FOLLOW</button>
		<%
			} else {
		%>
		<button id="followButton" onclick="follow('<%=opdto.getMb_id()%>')">UNFOLLOW</button>
		<%
			}
		%>
	</div>


	<div>
		<hr>
		<c:forEach items="${requestScope.list}" var="i">
			<tr>
				<td><a href="tm_SelectOne?tb_seq=${i.tb_seq}"> <img
						class="info" src="tm_upload/${i.tb_file}" alt="Not Found">
				</a></td>
			</tr>
		</c:forEach>
	</div>

	<script type="text/javascript" src="assets/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		var cnt =
	<%=opdto.getMb_follower()%>
		;
		function follow(mb_id) {
			$.ajax({

				url : "tm_followCon",
				type : "post",
				data : {
					"f_id" : mb_id
				},
				dataType : 'json',
				success : function(res) {
					console.log(res);
					// true로 넘어오면 팔로우 된 상태
					if (res.check == true) {
						$('#followButton').html("언팔로우");
						$('#mb_follower').html(res.follow);
					} else {
						$('#followButton').html("팔로우");
						$('#mb_follower').html(res.follow);
					}

				},
				error : function() {
					alert("요청 실패 팔로우 ");
				}

			})

		}
	</script>

</body>
</html>