<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/css/N1_main.css" />
    <link rel="stylesheet" href="./assets/css/overlay.css" />
    <title>main</title>
</head>

<body>
	<div id="side_bar">
		<b>My Real Travel in GwangJu </b>
		<button onClick="location.href='Join.jsp'">회원가입</button>
		<button onClick="location.href='Login.jsp'">로그인</button>
	</div> 
    <div id="side_all">
        <div id="side_one">
            <nav>
                <ul class="side_menu">
                	<!-- onClick="window.location.reload()" -->
                    <li><button class = "side_button" onClick="location.href='N1_main.jsp'"><a href="#" >검색</a></button></li>
                    <li><button class = "side_button" onClick="location.href='N2_travelplan1.html'"><a href="#" >여행계획</a></button></li>
                    <li><button class = "side_button" onClick="location.href='N3_mypage_login_1bookmark1.html'"><a href="#" >My</a></button></li>
                    <li><button class = "side_button" onClick="location.href='N4_mypage_sns.html'"><a href="#" >SNS</a></button></li>
                </ul>
            </nav>
        </div>
        <div id="side_two">
            <input type="text" id="search_keyword_query" placeholder="검색어 입력">
            <button id="search_keyword_query_button"><img src="./img/search.png"></button>
        </div>
        <div id="side_three">
           <ul>
               <li><button onClick="MapData('restaurant')">
                   <img src="./img/restaurant.png">
                   <p>맛집</p>
                </button></li>
               <li><button onClick="MapData('tour')">
					<img src="./img/location.png">
                   <p>관광지</p>
                </button></li>
               <li><button onClick="MapData('cafe')">
	                <img src="./img/cafe.png">
	                <p>카페</p>
                </button></li>
				<li><button onClick="MapData('accomodation')">
					<img src="./img/hotel.png">
					<p>숙박</p>
				</button></li>
           </ul>
        </div>
        <div id="side_four">
        </div>
    </div>
    
    
<!-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->    
	<div id="map" style="width: 73.3%; height: 100vh; float: right;"></div>
	
	
	<script src="./assets/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		function MapData(MapType) {
			$('#side_four').html('');
			$.ajax({
						url : "MapdataCon",
						type : "get",
						data : {
							"type":MapType
						},
						dataType : "json",
						success : function(res) {
							console.log(res);
							let table = "";
							for (let i = 0; i < res.length; i++) {
								table += '<ul class="tour_list">'
								table += '<li>'
								table += '<h3><a href="#" class ="local_find" value = '+i+'>'
										+ res[i].map_name + '</a></h3>';
								table += '<div class="map_name style="display:none;"">'
										+ res[i].map_name + '</div>';
								table += '<div class="map_stars">'
										+ res[i].map_stars + '</div>';
								//table += '<div>' + res[i].map_type + '</div>';
								table += '<div class="map_addr">'
										+ res[i].map_addr + '</div>';
								table += '<div class ="map_latitude" style="display:none;">'
										+ res[i].map_latitude + '</div>';
								table += '<div class ="map_longtitude" style="display:none;">'
										+ res[i].map_longtitude + '</div>';
								table += '<div class ="map_img" style="display:none;">'
									+ res[i].map_img + '</div>';
								table += '</li>'
								table += '</ul>'

							}
							$('#side_four').append(table)


						},
						error : function() {
							alert("요청 실패!")
						}

					})
		}
	</script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=31e189d0d305a85663770a625b11688d&libraries=services"></script>
	<script>	
		let ovr=[];
		let marker_storage = [];
		let latitude = "";
		let longtitude = "";
		var content="";
		var positions=[];
		
		//ajax로 가져온 데이터를 다시 지도api에 전송하기 위한 이벤트
		$(document).on("click",".local_find",function() {
			var index = $(this).attr('value');
			latitude_bring = document.getElementsByClassName('map_latitude');
			longtitude_bring = document.getElementsByClassName('map_longtitude');
			latitude = latitude_bring[index].innerHTML;
			longtitude = longtitude_bring[index].innerHTML;
			map_name = document.getElementsByClassName('map_name')[index].innerHTML;
			map_stars = document.getElementsByClassName('map_stars')[index].innerHTML;
			map_addr = document.getElementsByClassName('map_addr')[index].innerHTML;
			map_img = document.getElementsByClassName('map_img')[index].innerHTML;
			
			positions.push({title: map_name, 
		        latlng: new kakao.maps.LatLng(latitude, longtitude)})
			

			panTo();
			displayMarker(positions, map_name, map_stars, map_addr, map_img);
		});
		
		var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(35.11070531999631,
					126.87780481325912), // 지도의 중심좌표 - 스마트인재개발원
			level : 3	// 지도의 확대 레벨
		};
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		function panTo() {
			// 이동할 위도 경도 위치를 생성합니다 
			var moveLatLon = new kakao.maps.LatLng(latitude, longtitude);

			// 지도 중심을 부드럽게 이동시킵니다
			// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
			map.panTo(moveLatLon);
		}
		
		function displayMarker(positions, map_name, map_stars, map_addr, map_img) {
			console.log(positions);
			for(var i =0; i <positions.length; i++){
				// 마커를 생성하고 지도에 표시합니다
				var marker = new kakao.maps.Marker({
					map : map,
					position: positions[i].latlng, // 마커를 표시할 위치
			        //title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
					level : 3
				});
				marker_storage.push(marker);
				
				let star =null;
				if(map_stars==0){
					star="데이터부족";
				}else{
					star=map_stars+"점";
				}
				var content = '<div class="wrap">'
					+ '   		 <div class="info">'
					+ '        		<div class="title">'
					+ 					map_name
					+ '            	<div class="close" onclick="closeOverlay('+i+')" title="닫기"></div>'
					+ '        		</div>'
					+ '        		<div class="body">'
					+ '            		<div class="img">'
					+ '                		<img src="'+map_img+'" width="73" height="70">'
					+ '          		</div>'
					+ '             	<div class="desc">'
					+ '               		<div class="ellipsis">'
					+ 							map_addr 
					+'						</div>'
					+'                		<div class="jibun ellipsis">별점 : '+star+'</div>'  
					+'						<div align="right" style="padding:10px;"><button onclick="location.href=\'N2_travelplan1.html\'" id="move_button">계획세우러가기</button></div> ' 
					//+'                	<div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' 
					+ '            		</div>' 
					+ '       		</div>'
					+ '    		</div>' 
					+ '		</div>';
				

			}
			
			var overlay = new kakao.maps.CustomOverlay({
				content : content,
				map : map,
				position : marker.getPosition()
			});
			// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
			
			// 전역변수에 overlay담기
			ovr.push(overlay)
			
			
			// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
			kakao.maps.event.addListener(marker, 'click', function() {
				overlay.setMap(map);
			});
			//kakao.maps.event.addListener(marker, 'click', function() {
			//	closeOverlay();
			//});

			
		}
		
		function plan_page(){
			location.href="map.html";

		}
		
		function closeOverlay(i) {
			//console.log(typeof i);
			//console.log("ovr : ", ovr[i])
			console.log(marker_storage[i])
			ovr[i].setMap(null);
			marker_storage[i].setMap(null);
			
 			let a = positions[i]
			for(let j = 0; j < positions.length; j++) {
				  if(positions[j] == a)  {
				    positions.splice(j, 1);
				  }
			}
			
			console.log('삭제결과>>',positions);
			///return marker_storage */
		}
		
	</script>


</body>

</html>