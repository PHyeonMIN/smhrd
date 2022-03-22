<%@page import="com.snsDTO.tm_snsDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.memberDAO.tm_memberDAO"%>
<%@page import="com.snsDAO.tm_snsDAO"%>
<%@page import="com.memberDTO.tm_memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./assets/css/N4_mypage_login_3myinfo.css" />
<title>N4_mypage_login_3myinfo</title>

<style>
.filebox label {
	display: inline-block;
	padding-left: 6px;
	padding-top: 4px;
	padding-right: 6px;
	padding-bottom: 4px;
	color: BLACK;
	font-size: inherit;
	font-family: 'NanumBarunGothic';
	font-weight: bold;
	line-height: normal;
	vertical-align: middle;
	background-color: #CDFBE4;
	cursor: pointer;
	border: 1px solid #fff;
	border-radius: .25em;
	-webkit-transition: background-color 0.2s;
	transition: background-color 0.2s;
	padding-top: 4px;
	padding-right: 6px;
	padding-bottom: 4px;
	padding-right: 6px;
	padding-bottom: 4px;
	padding-bottom: 4px;
}

.filebox label:hover {
	background-color: #6ed36e;
}

.filebox label:active {
	background-color: #367c36;
}

.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}
</style>
</head>

<body>
	<%
		tm_memberDTO memberdto = (tm_memberDTO) session.getAttribute("dto");
		tm_memberDAO memberdao = new tm_memberDAO();
		tm_snsDAO snsdao = new tm_snsDAO();
		ArrayList<tm_snsDTO> list = new ArrayList<tm_snsDTO>();
		list = snsdao.searchMy(memberdto.getMb_id());

		int snsCount = snsdao.snsCount(memberdto.getMb_id());
	%>
	<div id="side_bar">
		<b>My Real Travel in GwangJu </b>
		<button onClick="location.href='tm_LogoutCon'">로그아웃</button>
	</div>
	<div id="side_all">
		<div id="side_one">
			<nav>
				<ul class="side_menu">
					<!-- onClick="window.location.reload()" -->
					<li><button class="side_button"
							onClick="location.href='N1_main.jsp'">
							<a href="#">검색</a>
						</button></li>
					<li><button class="side_button"
							onClick="location.href='N2_travelplan1.jsp'">
							<a href="#">여행계획</a>
						</button></li>
					<li><button class="side_button"
							onClick="location.href='N3_mypage_login_1bookmark1.jsp'">
							<a href="#">My</a>
						</button></li>
					<li><button class="side_button"
							onClick="location.href='N5_sns.jsp'">
							<a href="#">SNS</a>
						</button></li>
				</ul>
			</nav>
		</div>
		<div id="side_two">
			<ul>
				<li><button class="side_button"
						onClick="location.href='N3_mypage_login_1bookmark1.jsp'">내계획</button></li>
				<li><button class="side_button"
						onClick="location.href='N3_mypage_login_2mynews.jsp'">내소식</button></li>
				<li><button class="side_button"
						onClick="location.href='N3_mypage_login_3myinfo.jsp'">내정보</button></li>
			</ul>
		</div>
		<div id="side_three" style="height: 250px">
			<div id="profile_img">
				<div>
					<img src="tm_upload/<%=memberdto.getMb_img()%>"
						onerror="this.src=/tm_upload/4949.jpg">
				</div>
				<form action="imgChangeCon" method="post"
					enctype="multipart/form-data">
					<div class="filebox">
						<label for="file">이미지 변경</label> <input type="file" id="file"
							name="imgChange" accept="image/*" style="visibility:""hidden"}}>
						<label for="btn">확인</label>
						<button id="btn" type="submit" style="display: none"></button>
					</div>
				</form>
			</div>
			<div id="profile_info">
				<table>
					<colgroup>
						<col style="width: 40%;">
					</colgroup>
					<tr>
						<td>닉네임</td>
						<td><b><%=memberdto.getMb_nickname()%></b></td>
					</tr>
					<tr>
						<td>게시물</td>
						<td><b><%=snsCount%></b></td>
					</tr>
					<tr>
						<td>팔로워</td>
						<td><b><%=memberdto.getMb_follower()%></b></td>
					</tr>
					<tr>
						<td>팔로우</td>
						<td><b><%=memberdto.getMb_follow()%> </b></td>
					</tr>
				</table>
			</div>

		</div>
		<div id="galley">
			<%
				for (tm_snsDTO i : list) {
				System.out.println(i.getTb_file());
			%>
			<a href="tm_SelectOne?tb_seq=<%=i.getTb_seq()%>"><img
				src="tm_upload/<%=i.getTb_file()%>"
				style="float: left; width: 150px; height: 150px; padding:5px"></a>
			<%
				}
			%>
		</div>
		<div id="side_five"></div>
	</div>



	<!-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
	<div id="map" style="width: 73.3%; height: 100vh; float: right;"></div>


	<script src="./assets/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=31e189d0d305a85663770a625b11688d&libraries=services"></script>
	<script type="text/javascript">
		var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(35.11070531999631,
					126.87780481325912), // 지도의 중심좌표 - 스마트인재개발원
			level : 3
		// 지도의 확대 레벨
		};
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);
	</script>


</body>

</html>