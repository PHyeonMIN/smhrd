<%@page import="com.memberDTO.tm_memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/css/N3_mypage_logout.css" />
    <title>mypage</title>
</head>

<body>
	<div id="side_bar">
		<b>My Real Travel in GwangJu </b>
		<button onClick="location.href='Join.jsp'">회원가입</button>
		<% tm_memberDTO dto = (tm_memberDTO)session.getAttribute("dto");
		if (dto == null) {%>
		<button onClick="location.href='Login.jsp'">로그인</button>
		<%} else { %>
		<button onClick="location.href='tm_LogoutCon'">로그아웃</button>
		<%} %>
	</div> 
    <div id="side_all">
        <div id="side_one">
            <nav>
                <ul class="side_menu">
                	<!-- onClick="window.location.reload()" -->
                    <li><button class = "side_button" onClick="location.href='N1_main.jsp'"><a href="#" >검색</a></button></li>
					<%if (dto == null) {%>
					<li><button class = "side_button" onClick="location.href='mypage_logout.jsp'"><a href="#" >여행계획</a></button></li>
                    <li><button class = "side_button" onClick="location.href='mypage_logout.jsp'"><a href="#" >My</a></button></li>
                    <li><button class = "side_button" onClick="location.href='mypage_logout.jsp'"><a href="#" >SNS</a></button></li>
					<%} else {%>
                    <li><button class = "side_button" onClick="location.href='N2_travelplan1.jsp'"><a href="#" >여행계획</a></button></li>
                    <li><button class = "side_button" onClick="location.href='N3_mypage_login_1bookmark1.jsp'"><a href="#" >My</a></button></li>
                    <li><button class = "side_button" onClick="location.href='N4_mypage_sns.jsp'"><a href="#" >SNS</a></button></li>
                    <%} %>
                </ul>
            </nav>
        </div>
        <div id="side_two">
        </div>
        <div id="side_three">
			<br>
			<p>아직 로그인 되어 있지 않습니다. <br><br> 
				회원가입을 통해 <br><br>
				<b>My Real Travel in GwangJu</b>의 
			다양한 기능들을 누려보세요 ! </p>


        </div>
        <div id="side_four">
			<ul>
				<li><button class = "side_button" onClick="location.href='Join.jsp'"><a href="#">회원가입</a></button></li>
				<li><button class = "side_button" onClick="location.href='Login.jsp'"><a href="#">로그인</a></button></li>
			</ul>

		</div>
		<div id="side_five">
		</div>

    </div>

<!-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->    
	<div id="map" style="width: 73.3%; height: 100vh; float: right;"></div>
	
	
	<script src="./assets/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=31e189d0d305a85663770a625b11688d&libraries=services"></script>
	<script type="text/javascript">
		var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(35.11070531999631,
					126.87780481325912), // 지도의 중심좌표 - 스마트인재개발원
			level : 3	// 지도의 확대 레벨
		};
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
	</script>


</body>

</html>