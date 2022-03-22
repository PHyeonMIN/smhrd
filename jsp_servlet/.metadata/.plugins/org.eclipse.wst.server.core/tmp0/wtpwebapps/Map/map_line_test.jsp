<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--  앱키 :	31e189d0d305a85663770a625b11688d -->
	<!-- 지도를 표시할 div 입니다 -->
	<div id="map" style="width:80%; height: 100vh; float: right;"></div>


	<script src="./js/jquery-3.6.0.min.js"></script>
	<!--  <script src="//code.jquery.com/jquery-latest.min.js"></script> -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=31e189d0d305a85663770a625b11688d&libraries=services"></script>
	<script>

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);
		var distanceOverlay;
		var dots={};
		
		var  positions=[{
			title:"카카오",
			latlng : new kakao.maps.LatLng(33.450705,126.570677)
		}, {
			title:"제주공항",
			latlng : new kakao.maps.LatLng(33.5066211,126.492810)
		}, {
			title:"테마파크",
			latlng : new kakao.maps.LatLng(33.2906595,126.322529)
		}, {
			title:"수목원",
			latlng : new kakao.maps.LatLng(33.4696849,126.493305)
		}];
		
		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		    
		for (var i = 0; i < positions.length; i ++) {
		    
		    // 마커 이미지의 이미지 크기 입니다
		    var imageSize = new kakao.maps.Size(24, 35); 
		    
		    // 마커 이미지를 생성합니다    
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		    
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng, // 마커를 표시할 위치
		        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		        image : markerImage // 마커 이미지 
		    });
		}
//--------------------------------------------------------------------------------------------------------------------------------------
		var linePath;
		var lineLine = new kakao.maps.Polyline();
		var distance;
		
		for(var i = 0; i<positions.length; i++){
			if(i!=0){
				linePath = [positions[i-1].latlng, positions[i].latlng]
			}
			lineLine.setPath(linePath) // 선을 그릴 라인을 세팅합니다.
			
			
			var drawLine = new kakao.maps.Polyline({
				map:map,
				path : linePath,
				strokeWeight : 3, 			// 선의 두께입니다
				strokeColor : '#db4040',	// 선의 색깔입니다
				strokeOpacity : 1, 			// 선의 불투명도입니다. 0에서 1사이값이며 0에 가까울수록 투명합니다.
				strokeStyle : 'solid'		// 선의 스타일입니다.
			})
			
			distance = Math.round(lineLine.getLength());
			displayCircleDot(positions[i].latlng, distance);
		}
		
		function displayCircleDot(position, distance){
			if(distance>0){
				//클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
				var distanceOverlay = new kakao.maps.CustomOverlay({
					content : '<div class="dotOverlay">거리<span class="number">'
							+ distance + '</span>m</div>',
					position : position,
					yAnchor : 1,
					zIndex : 2,
				
				})	;
				
				distanceOverlay.setMap(map);
			}
		}
		
	</script>


</body>
</html>