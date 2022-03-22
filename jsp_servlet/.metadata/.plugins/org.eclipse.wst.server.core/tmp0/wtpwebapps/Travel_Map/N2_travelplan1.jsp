<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/css/N2_travelplan1.css" />
    <title>travelplan1</title>
</head>

<body>
	<div id="side_bar">
		<b>My Real Travel in GwangJu </b>
		<button onClick="location.href='tm_LogoutCon'">로그아웃</button>
	</div> 
    <div id="side_all">
        <div id="side_one" style="line-height: inherit;">
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
        <div id="side_two" style="height:90%;">
			<ul>
				<li><button class="travel_plan"><a href="N2_travelplan2.jsp">여행계획을만들어주세요!</a></button></li>
				<li><button class="travel_plan"><a href="N2_travelplan2.jsp">여행계획을만들어주세요!</a></button></li>
				<li><button class="travel_plan"><a href="N2_travelplan2.jsp">여행계획을만들어주세요!</a></button></li>
				<li><button class="travel_plan" id="addplan_button" onClick="addplan()"><a href="#">+</a></button></li>
			</ul>
        </div>
		<!--  <div id="side_three"><b>뭘넣을까 .. ?</b></div> -->
    </div>

<!-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->    
	<div id="map" style="width: 73.3%; height: 100vh; float: right;"></div>
	
	
	<script src="./assets/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		
		function addplan(){
			let addtag =""
			addtag="<li><button class=\"travel_plan\"><a href=\"N2_travelplan2.html\">여행계획을만들어주세요!</a></button></li>"
			$('#addplan_button').parent().before(addtag);
		}
	
	</script>
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