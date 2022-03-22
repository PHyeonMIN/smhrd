<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="./assets/css/N4_mypage_login_2mynews.css" />
	<title>N4_mypage_login_2mynews</title>
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
		<div id="side_two">
			<ul>
				<li><button class = "side_button" onClick="location.href='N3_mypage_login_1bookmark1.jsp'">내 계획</button></li>
				<li><button class = "side_button" onClick="location.href='N3_mypage_login_2mynews.jsp'">내소식</button></li>
				<li><button class = "side_button" onClick="location.href='N3_mypage_login_3myinfo.jsp'">내정보</button></li>
			</ul>
		</div>
		<div id="side_three">
		</div>
		<div id="side_four">
		</div>
		<div id="side_five">
		</div>

	</div>
	<script src="./assets/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		window.onload = function eventLog() {

			$
			.ajax({
				url : 'eventLogCon',
				type : 'post',
				data : {
					'conID' : "<% out.print(session.getAttribute("conID")); %>"
				},
				dataType : 'json',
				success : function(res) {
					
					console.log(res)
					
					if (res.length == 0) {
						table = '';
						table += '<br>'
						table += '<h3 align="center">새로운 소식이 없습니다.</h3>';
						$('#side_three').append(table);
					}
					
					for (let i = 0; i < res.length; i++) {
						
						table = ''
						
						if (res[i].log_type == "likes") {
						
							table += '<br>';
							table += '<table width="450" height="70" align="center">';
							table += '<tr>';
							if (res[i].mb_img == null) {
								table += '<td rowspan="2" width="20%"><img src="./phm_img/default_profile.png" width="50" height="50" style="border:1px solid #c8c8c8; border-radius:70%;"></td>';	
							} else {
								table += '<td rowspan="2" width="20%"><img src="tm_upload/' + res[i].mb_img + '" width="50" height="50" style="border-radius:70%;"></td>';
							}
							table += '<td><b>' + res[i].mb_nickname + '</b></td>';
							table += '</tr>';
							table += '<tr>';
							table += '<td>회원님의 게시글에 좋아요를 보냈습니다.</td>';
							table += '</tr>';
							table += '</table>';
							table += '<hr width="450" align="center">';
							
							$('#side_three').append(table);
							
						} else if (res[i].log_type == "follower") {
							
							table += '<br>';
							table += '<table width="450" height="70" align="center">';
							table += '<tr>';
							if (res[i].mb_img == null) {
								table += '<td rowspan="2" width="20%"><img src="./phm_img/default_profile.png" width="50" height="50" style="border:1px solid #c8c8c8; border-radius:70%;"></td>';	
							} else {
								table += '<td rowspan="2" width="20%"><img src="tm_upload/' + res[i].mb_img + '" width="50" height="50" style="border-radius:70%;"></td>';
							}
							table += '<td><b>' + res[i].mb_nickname + '</b></td>';
							table += '</tr>';
							table += '<tr>';
							table += '<td>회원님을 팔로우하기 시작했습니다.</td>';
							table += '</tr>';
							table += '</table>';
							table += '<hr width="450" align="center">';
							
							$('#side_three').append(table);
							
						} else if (res[i].log_type == "insert") {
							
							table += '<br>';
							table += '<table width="450" height="70" align="center">';
							table += '<tr>';
							table += '<td><b>새로운 계획이 등록되었습니다.</b></td>';
							table += '</tr>';
							table += '<tr>';
							table += '<td>내 계획에서 확인하세요!</td>';
							table += '</tr>';
							table += '</table>';
							table += '<hr width="450" align="center">';
							
							$('#side_three').append(table);
						}
					}
				},
				error : function() {
					alert('검색실패');
				}
			});

		}
	</script>

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