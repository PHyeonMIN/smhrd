<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="./assets/css/mainstyle.css" />
<style>
.wrap {
	position: absolute;
	left: 0;
	bottom: 40px;
	width: 288px;
	height: 132px;
	margin-left: -144px;
	text-align: left;
	overflow: hidden;
	font-size: 12px;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	line-height: 1.5;
}

.wrap * {
	padding: 0;
	margin: 0;
}

.wrap .info {
	width: 286px;
	height: 120px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
}

.wrap .info:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.info .title {
	padding: 5px 0 0 10px;
	height: 30px;
	background: #eee;
	border-bottom: 1px solid #ddd;
	font-size: 18px;
	font-weight: bold;
}

.info .close {
	position: absolute;
	top: 10px;
	right: 10px;
	color: #888;
	width: 17px;
	height: 17px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
}

.info .close:hover {
	cursor: pointer;
}

.info .body {
	position: relative;
	overflow: hidden;
}

.info .desc {
	position: relative;
	margin: 13px 0 0 90px;
	height: 75px;
}

.desc .ellipsis {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.desc .jibun {
	font-size: 11px;
	color: #888;
	margin-top: -2px;
}

.info .img {
	position: absolute;
	top: 6px;
	left: 5px;
	width: 73px;
	height: 71px;
	border: 1px solid #ddd;
	color: #888;
	overflow: hidden;
}

.info:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: 0;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.info .link {
	color: #5085BB;
}
</style>
</head>
<body>
	<div style="float: left;">
		<!-- 변경 -->
		<div id="blank"></div>
		<div>
			<p id="web_name">
				<b>My Real Travel in GwangJu</b>
			</p>
		</div>
		<div id="header">
			<nav>
				<ul class="menu">
					<li><botton>검색</botton></li>
					<li><botton>여행계획</botton></li>
					<li><botton>My</botton></li>
					<li><botton>SNS</botton></li>
				</ul>
				<a class="cta" herf=""></a>
			</nav>
		</div>
		<div id='middle'>
			<input type="text" id="search_keyword_query" placeholder="검색어 입력">
			<button id="search_keyword_query_button" onclick="search()">
				<img src="./img/search.png">
			</button>
		</div>

		<div id="info">
			<ul class="list_around">
				<li>
					<button class="btn_around" onClick="goodtaste()">
						<span class="ico_food"><img src="./img/restaurant.png"></span>
						<span class="txt_around">맛집</span>
					</button>
				</li>
				<li>
					<button class="btn_around">
						<span class="ico_tourist"><img
							src="./img/amusement-park.png"></span> <span class="txt_around">관광지</span>
					</button>
				</li>
				<li>
					<button class="btn_around">
						<span class="ico_cafe"><img src="./img/cafe.png"></span> <span
							class="txt_around">카페</span>
					</button>
				</li>
			</ul>



		</div>
		<div id="bottom">
			<ul class="tour_list">

			</ul>
		</div>
	</div>
	<div id="map" style="width: 65%; height: 100vh; float: right;"></div>
	<!-- 변경 -->


	<script src="js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		let table = "";
		function goodtaste() {
			$
					.ajax({
						url : "MapdataCon",
						type : "get",
						dataType : "json",
						success : function(res) {
							console.log(res);
							$('ul.tour_list').html('');
							for (let i = 0; i < res.length; i++) {

								table += '<li>'
								table += '<h3><a href="#" class ="local_find" value = '+i+'>'
										+ res[i].map_name + '</a></h3>';
								table += '<div class="map_name style="display:none;"">'
										+ res[i].map_name + '</div>';
								table += '<div class="map_stars">'
										+ res[i].map_stars + '</div>';
								table += '<div>' + res[i].map_type + '</div>';
								table += '<div class="map_addr">'
										+ res[i].map_addr + '</div>';
								table += '<div class="map_info">'
										+ res[i].map_info + '</div>';

								table += '<div class ="map_latitude" style="display:none;">'
										+ res[i].map_latitude + '</div>';
								table += '<div class ="map_longtitude" style="display:none;">'
										+ res[i].map_longtitude + '</div>';
								table += '</li>'

							}

							$('ul.tour_list').append(table)

						},
						error : function() {
							alert("요청 실패!")
						}

					})
		}
	</script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=31e189d0d305a85663770a625b11688d&libraries=services"></script>
	<script>
		// 클릭시 경도 위도 가져오는 코드
		let ovr=[];
		let marker_storage = [];
		let latitude = "";
		let longtitude = "";
		let overlay = null;
		var content="";
		var positions=[];
		$(document).on("click",".local_find",function() {

							var index = $(this).attr('value');
							console.log(index);

							latitude_bring = document
									.getElementsByClassName('map_latitude');
							longtitude_bring = document
									.getElementsByClassName('map_longtitude');
							latitude = latitude_bring[index].innerHTML;
							longtitude = longtitude_bring[index].innerHTML;
							map_name = document.getElementsByClassName('map_name')[index].innerHTML;
							map_stars = document.getElementsByClassName('map_stars')[index].innerHTML;
							map_addr = document.getElementsByClassName('map_addr')[index].innerHTML;
							map_info = document.getElementsByClassName('map_info')[index].innerHTML;
							
							positions.push({title: map_name, 
						        latlng: new kakao.maps.LatLng(latitude, longtitude)})
							

							panTo();
							displayMarker1(latitude, longtitude,map_name, map_stars, map_addr,map_info, positions);
							
							

						});

		var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(35.11070531999631,
					126.87780481325912), // 지도의 중심좌표 - 스마트인재개발원
			level : 3
			// 지도의 확대 레벨
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

		
//----------------------------------------------------------------------------------------------------------------------
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();

		
		var txt;
		function search() {
			txt = $('#search_keyword_query').val()
			// 키워드로 장소를 검색합니다
			ps.keywordSearch(txt, placesSearchCB);
		}

		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				var bounds = new kakao.maps.LatLngBounds();

				for (var i = 0; i < data.length; i++) {
					displayMarker(data[i]); //마커 찍어주는 부분
					bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x)); //범위설정
				}

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
				map.setBounds(bounds);
			}
		}

		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
		});
//-----------------------------------------------------------------------------------------------------------------------
		//원래 예시코드보여드릴까요? 네넹
		
		function displayMarker1(latitude, longtitude,map_name, map_stars, map_addr,map_info, positions) {

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
				var content = '<div class="wrap">'
					+ '   		 <div class="info">'
					+ '        		<div class="title">'
					+ 					map_name
					+ '            	<div class="close" onclick="closeOverlay()" title="닫기"></div>'
					+ '        		</div>'
					+ '        		<div class="body">'
					+ '            		<div class="img">'
					+ '                		<img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">'
					+ '          		</div>'
					+ '             	<div class="desc">'
					+ '               		<div class="ellipsis">'
					+ 							map_addr 
					+ '						</div>'
					+						'<button onclick="plan_page()">계획세우러가기</button> ' 
					//+'                	<div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>'  
					//+'                	<div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' 
					+ '            		</div>' 
					+ '       		</div>'
					+ '    		</div>' 
					+ '		</div>';
				
			}

			overlay = new kakao.maps.CustomOverlay({
				content : content,
				map : map,
				position : marker.getPosition()
			});
			// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
			
			// 전역변수에 overlay담기
			//ovr = overlay;			//여기를 저장해준이유가 이함수를 실행하면 overlay자체가 초기화되버려서 원래는 저 x눌러도 안꺼졌어요! 원래 있던 코드가 아니라 현민씨가 바꾼건가요?
					// 네네 선생님조언듣고 좀 고친거예요 네넹! 좀 더 봐볼게요
			//ovr.push(overlay)
			
			
			// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
			kakao.maps.event.addListener(marker, 'mouseover', function() {
				overlay.setMap(map);
			});
			//kakao.maps.event.addListener(marker, 'click', function() {
			//	closeOverlay();
			//});
			
			function plan_page(){
				location.href="map.html";

			}
			
			function closeOverlay() {
				//console.log(typeof i);
				overlay.setMap(null);
			}
		}
		

	
	</script>


</body>
</html>