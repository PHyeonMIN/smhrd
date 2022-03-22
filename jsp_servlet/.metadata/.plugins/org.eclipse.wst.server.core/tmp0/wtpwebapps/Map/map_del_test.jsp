<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="map" style="width:80%; height: 100vh; float: right;"></div>
	<button Onclick="start()">1111111111</button>
	<button Onclick="delete_map()">222</button>
	<script src="./js/jquery-3.6.0.min.js"></script>
	<!--  <script src="//code.jquery.com/jquery-latest.min.js"></script> -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=31e189d0d305a85663770a625b11688d&libraries=services"></script>
	<script>
	function start(){
		displayMarker(positions);
	}
	function delete_map(){
		marker_allClose(markers);
	}
	
	
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		level : 10
	// 지도의 확대 레벨
	};

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);
	var positions = [];
	positions.push({title:"1", 
        latlng: new kakao.maps.LatLng(35.109294747397925, 126.87530854205828)});
	positions.push({title:"2", 
        latlng: new kakao.maps.LatLng(35.116772232054196, 126.90629341808172)});
	var markers = [];
	function displayMarker(positions) {
		for (var i = 0; i < positions.length; i ++) {
		    
		    // 마커 이미지의 이미지 크기 입니다
		    //var imageSize = new kakao.maps.Size(24, 35); 
		    
		    // 마커 이미지를 생성합니다    
		    //var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		    
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng, // 마커를 표시할 위치
		        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		        //image : markerImage, // 마커 이미지 
		        level:3
		        
		    });
		   markers.push(marker)
		    
		}
		
	}
	
	function marker_allClose(del_mar){
		
		for(let i =0; i<del_mar.length; i++){
			del_mar[i].setMap(null);
			console.log(i,del_mar[i])
		}
	}
	</script>
</body>
</html>