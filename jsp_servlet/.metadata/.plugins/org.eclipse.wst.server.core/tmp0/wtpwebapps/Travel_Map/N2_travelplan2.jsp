<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/css/N2_travelplan2.css" />
    <title>travelplan2</title>
</head>

<body>
	<div id="side_bar">
		<b>My Real Travel in GwangJu </b>
		<button onClick="location.href='tm_LogoutCon'">로그아웃</button>
	</div> 
    <div id="side_all">
        <div id="side_one">
            <nav>
                <ul class="side_menu">
                    <!-- onClick="window.location.reload()" -->
                    <li><button class = "side_button" onClick="location.href='N1_main.jsp'"><a href="#" >검색</a></button></li>
                    <li><button class = "side_button" onClick="location.href='N2_travelplan1.jsp'"><a href="#" >여행계획</a></button></li>
                    <li><button class = "side_button" onClick="location.href='N3_mypage_login_1bookmark1.jsp'"><a href="#" >My</a></button></li>
                    <li><button class = "side_button" onClick="location.href='N5_sns.jsp'"><a href="#" >SNS</a></button></li>
                </ul>
            </nav>
        </div>
        <form action="travelplan2Con" method="get">
	        <div id="side_two" style="display: flex; align-items: center; justify-content: center;">
				<p>여행 제목 : <input type="text" name="travel_title"><p>
	        </div>
	        <div id="side_three">
				<br><br>
				<button id="side_two_header" style="margin:0px;">가는날 / 오는날 선택</button><br><br>	
				가는 날 : <input type="date" name="start_date"><br><br>	
				오는 날 : <input type="date" name="end_date"><br><br>	
				
	        </div>
	        <div id="side_four">
				인원 수 : <input type="number" min="0" max="10" name="people"><b>명</b>
			</div>
			<div id="side_five">
				<ul>
					<li><button class = "side_button"><a href="#" onClick="window.location.reload()">초기화</a></button></li>
					<li><button class = "side_button" type="submit">다음으로</button></li>
				</ul>
			</div>
		</form>
		<div id="side_six"></div>
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