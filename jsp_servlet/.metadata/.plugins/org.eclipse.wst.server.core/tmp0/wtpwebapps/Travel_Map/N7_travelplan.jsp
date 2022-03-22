<%@page import="com.PHM_travel_mapDAO.PHM_travel_planDAO"%>
<%@page import="com.snsDTO.tm_snsDTO"%>
<%@page import="com.PHM_travel_mapDTO.PHM_travel_planDTO"%>
<%@page import="com.PHM_travel_mapDTO.PHM_travel_mapDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="./assets/css/N4_mypage_login_1bookmark2.css" />
	<title>N4_mypage_login_1bookmark1</title>
</head>

<body>
	<%
		tm_snsDTO dto1 = (tm_snsDTO)session.getAttribute("id_title");
		String t_title = dto1.getT_title();
		String mb_id = dto1.getMb_id();
		System.out.println(t_title);
		PHM_travel_planDAO dao = new PHM_travel_planDAO();
		
		PHM_travel_mapDTO dto2 = dao.bring_travelplan1(mb_id, t_title);
		
		int end_date = Integer.parseInt(dto2.getEnd_date().substring(8));
		int start_date = Integer.parseInt(dto2.getStart_date().substring(8));
		int total = end_date - start_date+1;
		
		ArrayList<PHM_travel_planDTO> arr2 = dao.bring_travelplan2(mb_id, t_title);
		
		
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
                    <li><button class = "side_button" onClick="location.href='N1_main.jsp'"><a href="#" >검색</a></button></li>
                    <li><button class = "side_button" onClick="location.href='N2_travelplan1.jsp'"><a href="#" >여행계획</a></button></li>
                    <li><button class = "side_button" onClick="location.href='N3_mypage_login_1bookmark1.jsp'"><a href="#" >My</a></button></li>
                    <li><button class = "side_button" onClick="location.href='N5_sns.jsp'"><a href="#" >SNS</a></button></li>
                </ul>
			</nav>
		</div>
		<!--  <div id="side_two">
		</div>-->
		<div id="side_three">
			<% 
			int a = 1;
			for(int i =0; i<total ;i++) {%>
				<table id="plan_table_one">
					<caption><%=i+1 %>일차</caption>
					<colgroup>
						<col style="width: 10%;">
						<col style="width: 40%;">
						<col style="width: 25%;">
						<col style="width: 25%;">
					</colgroup>
					<% 
					for(int j =0; j<arr2.size() ; j++){ 
						if(Integer.valueOf(arr2.get(j).getDay())==(i+1)){
							
					%>
						<tr>
							<td><%=arr2.get(j).getCnt() %></td>
							<td id='map_name<%=arr2.get(j).getDay() %>_<%=arr2.get(j).getCnt() %>'><%=arr2.get(j).getMap_name() %></td>
							<td><%=arr2.get(j).getStartTime() %></td>
							<td><%=arr2.get(j).getEndTime() %></td>
						</tr>
						<tr>
							<td>메모 : </td>
							<td colspan="3"><%=arr2.get(j).getMemo() %></td>
						</tr>
						
					<%}%>
						
					<%}
				 %>
						 <tr>
							<td colspan="4" id="plan_table_last" >
								<button onClick = "kakao(<%=i+1%>)" >거리보기</button>
								<button onClick = "tmap(<%=i+1%>)" >경로보기</button>
							</td>
						</tr>
				</table>
			<%} %>
		</div>
		
		<div id="side_four">
			<ul>
				<li><button class="side_button" onClick="location.href='N5_sns.jsp'" style="width:150px;">sns로 돌아가기</button></li>
			</ul>
		</div>
		<div id="side_five">
			
		</div>
		
	</div>

<!-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->    
	<div id="kakao_map" style="width: 73.3%; height: 100vh; float: right;"></div>
	<div id="tmap_map" style="width: 73.3%; height: 100vh; float: right; "></div>
	
	
	<script src="./assets/js/jquery-3.6.0.min.js"></script>
	
	<script>
	
		// 티맵용도
		var plan_list=[];
		var plan_list1=[];
		var plan_list2=[];
		var plan_list3=[];
		var plan_list4=[];
		var plan_list5=[];
		var plan_list6=[];
		//카카오 용도
		var positions1=[];
		var positions2=[];
		var positions3=[];
		var positions4=[];
		var positions5=[];
		var positions6=[];
		//데이터 전송용
		var map_name1='';
		var map_name2='';
		var map_name3='';
		var map_name4='';
		var map_name5='';
		
		
		
		
		
		function kakao(day){
			if(day==1){
				map_name1 = $("#map_name1_1").text();
				map_name2 = $("#map_name1_2").text();
				map_name3 = $("#map_name1_3").text();
				map_name4 = $("#map_name1_4").text();
				map_name5 = $("#map_name1_5").text();
			}else if(day==2){
				map_name1 = $("#map_name2_1").text();
				map_name2 = $("#map_name2_2").text();
				map_name3 = $("#map_name2_3").text();
				map_name4 = $("#map_name2_4").text();
				map_name5 = $("#map_name2_5").text();

			}else if(day==3){
				map_name1 = $("#map_name3_1").text();
				map_name2 = $("#map_name3_2").text();
				map_name3 = $("#map_name3_3").text();
				map_name4 = $("#map_name3_4").text();
				map_name5 = $("#map_name3_5").text();

			}else if(day==4){
				map_name1 = $("#map_name4_1").text();
				map_name2 = $("#map_name4_2").text();
				map_name3 = $("#map_name4_3").text();
				map_name4 = $("#map_name4_4").text();
				map_name5 = $("#map_name4_5").text();
			}
			
			$.ajax({
				url : "my_bookmarkMap",	
				type : "get",
				data : {
					"map_name1" : map_name1,
					"map_name2" : map_name2,
					"map_name3" : map_name3,
					"map_name4" : map_name4,
					"map_name5" : map_name5
				},
				dataType : "json",
				success : function(res){ 
					marker_allClose(markers);
					drawLine_allClose(drawLine_list);
					distanceOverlay_allClose(distanceOverlay_list);
					var positions=[];
					console.log(res);
					for(let i =0; i<res.length; i++){
						positions.push({title: res[i].map_name, 
				        	latlng: new kakao.maps.LatLng(res[i].map_latitude, res[i].map_longtitude)});
					}
					console.log(positions);
					displayMarker(positions);
					kakao_route(positions);
				},
				error : function(){
					alert("요청 실패!")
				}
			
			})
		}
		
		function tmap(day){
			if(day==1){
				map_name1 = $("#map_name1_1").text();
				map_name2 = $("#map_name1_2").text();
				map_name3 = $("#map_name1_3").text();
				map_name4 = $("#map_name1_4").text();
				map_name5 = $("#map_name1_5").text();
			}else if(day==2){
				map_name1 = $("#map_name2_1").text();
				map_name2 = $("#map_name2_2").text();
				map_name3 = $("#map_name2_3").text();
				map_name4 = $("#map_name2_4").text();
				map_name5 = $("#map_name2_5").text();

			}else if(day==3){
				map_name1 = $("#map_name3_1").text();
				map_name2 = $("#map_name3_2").text();
				map_name3 = $("#map_name3_3").text();
				map_name4 = $("#map_name3_4").text();
				map_name5 = $("#map_name3_5").text();

			}else if(day==4){
				map_name1 = $("#map_name4_1").text();
				map_name2 = $("#map_name4_2").text();
				map_name3 = $("#map_name4_3").text();
				map_name4 = $("#map_name4_4").text();
				map_name5 = $("#map_name4_5").text();
			}
			console.log("map_name1",map_name1);
			console.log("map_name2",map_name2);
			console.log("map_name3",map_name3);
			console.log("map_name4",map_name4);
			console.log("map_name5",map_name5);
			$.ajax({
				url : "my_bookmarkMap",	
				type : "get",
				data : {
					"map_name1" : map_name1,
					"map_name2" : map_name2,
					"map_name3" : map_name3,
					"map_name4" : map_name4,
					"map_name5" : map_name5
				},
				dataType : "json",
				success : function(res){ 
					console.log('ajax응답결과>> ',res);
					tmap_route(res);
				},
				error : function(){
					alert("요청 실패!")
				}
			
			})			
		}
		
	
	
	</script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=31e189d0d305a85663770a625b11688d&libraries=services"></script>
	<script type="text/javascript">
		//카카오맵 지도 생성
		var mapContainer = document.getElementById('kakao_map'); // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(35.11070531999631, 126.87780481325912), // 지도의 중심좌표 - 스마트인재개발원
			level : 3	// 지도의 확대 레벨
		};
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		var markers = [];
		
		function displayMarker(positions) {
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
			        image : markerImage, // 마커 이미지 
			        level:3
			    });
			    
			   markers.push(marker);
			    
			}
			
		}
		function marker_allClose(marker_del){
			for(let i =0; i<marker_del.length; i++){
				marker_del[i].setMap(null);
				console.log(i,marker_del[i])
			}
			markers=[];
		}
		
	</script>




<!--카카오 -------------------------------------------------------------------------------------------------------------------------------------------------- -->
<script type="text/javascript">
		// 지도 미리보기 파트(카카오맵) 
		var drawLine_list = [];
		var distanceOverlay_list = [];
		function drawLine_allClose(drawLine_list){
			for(let i =0; i<drawLine_list.length; i++){
				drawLine_list[i].setMap(null);
			}
		}
		function distanceOverlay_allClose(distanceOverlay_list){
			for(let i =0; i<distanceOverlay_list.length; i++){
				distanceOverlay_list[i].setMap(null);
			}
		}
		function kakao_route(positions){
			document.getElementById('kakao_map').style.display="block";
			document.getElementById('tmap_map').style.display="none";
			var distanceOverlay;
			var linePath;
			var lineLine = new kakao.maps.Polyline();
			var distance;
			/*if(day==1){
				positions = positions1;
			}else if(day==2){
				positions = positions2;
			}else if(day==3){
				positions = positions3;
			}else if(day==4){
				positions = positions4;
			}else if(day==5){
				positions = positions5;
			}else if(day==6){
				positions = positions6;
			}*/
			
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
				drawLine_list.push(drawLine);
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
					distanceOverlay_list.push(distanceOverlay);
				}
			}
			
			var moveLatLon = new kakao.maps.LatLng(35.1599801229349, 126.85227886055003)
			map.setLevel(7);
			map.setCenter(moveLatLon);
		}
	</script>



<!-- 티맵---------------------------------------------------------------------------------------------------------------------------------------------- -->
<script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xxefc4aaf819ab46d09bfedeef6adff714"></script>
	<script type="text/javascript">
		map1 = new Tmapv2.Map("tmap_map", {
			center: new Tmapv2.LatLng(35.1599801229349, 126.85227886055003),
		});
		map1.setZoom(14);
	</script>
	<script>
	
		var tmap_markers =[];
		var new_polyLine = [];
		// 지도 경로미리보기 파트(티맵)
		function tmap_route(plan_list){
			tmap_allClose();
			tmap_poly_allClose();
			
			document.getElementById('kakao_map').style.display="none";
			document.getElementById('tmap_map').style.display="block";
			
			
			var new_Click_polyLine = [];
			
			function drawData(data){
				
				// 지도위에 선은 다 지우기
				routeData = data;
				var resultStr = "";
				var distance = 0;
				var idx = 1;
				var newData = [];
				var equalData = [];
				var pointId1 = "-1234567";
				var ar_line = [];
				
				for (var i = 0; i < data.features.length; i++) {
					var feature = data.features[i];
					//배열에 경로 좌표 저잘
					if(feature.geometry.type == "LineString"){
						ar_line = [];
						for (var j = 0; j < feature.geometry.coordinates.length; j++) {
							var startPt = new Tmapv2.LatLng(feature.geometry.coordinates[j][1],feature.geometry.coordinates[j][0]);
							ar_line.push(startPt);
							pointArray.push(feature.geometry.coordinates[j]);
						}
						var polyline = new Tmapv2.Polyline({
					        path: ar_line,
					        strokeColor: "#ff0000", 
					        strokeWeight: 6,
					        map: map1
					    });
						new_polyLine.push(polyline);
					}
					var pointId2 = feature.properties.viaPointId;
					if (pointId1 != pointId2) {
						equalData = [];
						equalData.push(feature);
						newData.push(equalData);
						pointId1 = pointId2;
					}
					else {
						equalData.push(feature);
					}
				}
				geoData = newData;
				var markerCnt = 1;
				for (var i = 0; i < newData.length; i++) {
					var mData = newData[i];
					var type = mData[0].geometry.type;
					var pointType = mData[0].properties.pointType;
					var pointTypeCheck = false; // 경유지 일때만 true
					if (mData[0].properties.pointType == "S") {
						var img = 'http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png';
						var lon = mData[0].geometry.coordinates[0];
						var lat = mData[0].geometry.coordinates[1];
					}
					else if (mData[0].properties.pointType == "E") {
						var img = 'http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png';
						var lon = mData[0].geometry.coordinates[0];
						var lat = mData[0].geometry.coordinates[1];
					}
					else {
						markerCnt=i;
						var lon = mData[0].geometry.coordinates[0];
						var lat = mData[0].geometry.coordinates[1];
					}	
				}
			}
			// 2. 시작, 도착 심볼찍기
			
			var markerList = [];
			var pointArray = [];
			let plan_list_cnt = plan_list.length-1
			// 시작
			addMarker("llStart",plan_list[0].map_longtitude, plan_list[0].map_latitude,1);
			// 도착 
			addMarker("llEnd",plan_list[plan_list_cnt].map_longtitude, plan_list[plan_list_cnt].map_latitude,2);
			
			function addMarker(status, lon, lat, tag) {
				//출도착경유구분
				//이미지 파일 변경.
				var markerLayer;
				switch (status) {
					case "llStart":
						imgURL = 'http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png';
						break;
					case "llPass":
						imgURL = 'http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_p.png';
						break;
					case "llEnd":
						imgURL = 'http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png';
						break;
					default:
				};
				var marker = new Tmapv2.Marker({
					position: new Tmapv2.LatLng(lat,lon),
					icon: imgURL,
					map: map1
				});
				tmap_markers.push(marker);
				// 마커 드래그 설정
				marker.tag = tag;
				marker.addListener("dragend", function (evt) {
				markerListenerEvent(evt);
			    });
			    marker.addListener("drag", function (evt) {    	
			    	markerObject = markerList[tag];
			    });
			    markerList[tag] = marker;
				return marker;
			}
		
			// 3. 경유지 심볼 찍기
			for(let i=1; i<plan_list.length-1; i++){
				addMarker("llPass",plan_list[i].map_longtitude,plan_list[i].map_latitude,i+2);
			}
			
			// 4. 경로탐색 API 사용요청
			var startX = plan_list[0].map_longtitude;
			var startY = plan_list[0].map_latitude;
			var endX = plan_list[plan_list_cnt].map_longtitude;
			var endY = plan_list[plan_list_cnt].map_latitude;
			var passList = "";
			for(let i = 1; i<plan_list.length-1;i++){
				passList +=plan_list[i].map_longtitude+','+plan_list[i].map_latitude+'_';
			}
			var prtcl;
			var headers = {};
			headers["appKey"]="l7xxefc4aaf819ab46d09bfedeef6adff714";
			$.ajax({
					method:"POST", 
					headers : headers, 
					url:"https://apis.openapi.sk.com/tmap/routes?version=1&format=json",//
					async:false,
					data:{ 
						startX : startX,
						startY : startY,
						endX : endX,
						endY : endY,
						passList : passList,
						reqCoordType : "WGS84GEO",
						resCoordType : "WGS84GEO",
						angle : "172",
						searchOption : "0",
						trafficInfo : "Y"
					},
					success:function(response){
						console.log("팍",response)
					prtcl = response;
					
					// 5. 경로탐색 결과 Line 그리기 
					var trafficColors = {
						extractStyles:true,
						/* 실제 교통정보가 표출되면 아래와 같은 Color로 Line이 생성됩니다. */
						trafficDefaultColor:"#636f63", //Default
						trafficType1Color:"#19b95f", //원할
						trafficType2Color:"#f15426", //지체
						trafficType3Color:"#ff970e"  //정체		
					};    			
					var style_red = {
						fillColor:"#FF0000",
						fillOpacity:0.2,
						strokeColor: "#FF0000",
						strokeWidth: 3,
						strokeDashstyle: "solid",
						pointRadius: 2,
						title: "this is a red line"
					};
					drawData(prtcl);
				
				
					// 6. 경로탐색 결과 반경만큼 지도 레벨 조정
					var newData1 = geoData[0];
					console.log('newData1>>', newData1);
					PTbounds = new Tmapv2.LatLngBounds();
							for (var i = 0; i < newData1.length; i++) {
								var mData = newData1[i];
								var type = mData.geometry.type;
								var pointType = mData.properties.pointType;
								if(type == "Point"){
									var linePt = new Tmapv2.LatLng(mData.geometry.coordinates[1],mData.geometry.coordinates[0]);
									console.log(linePt);
									PTbounds.extend(linePt);
								}
								else{
									var startPt,endPt;
									for (var j = 0; j < mData.geometry.coordinates.length; j++) {
										var linePt = new Tmapv2.LatLng(mData.geometry.coordinates[j][1],mData.geometry.coordinates[j][0]);
										PTbounds.extend(linePt);
									}
							}
						}
						map1.fitBounds(PTbounds);
				
					} ,
					error:function(request,status,error){
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		}
		function tmap_allClose(){
			for(let i =0; i<tmap_markers.length; i++){
				tmap_markers[i].setMap(null);
			}
			tmap_markers=[];
		}
		function tmap_poly_allClose(){
			console.log('tmap_poly_allClose>> ',new_polyLine);
			
			if(new_polyLine!=null){
				for(let i =0; i<new_polyLine.length; i++){
					new_polyLine[i].setMap(null);
				}
				new_polyLine=[];
			}
		}
	</script>
</body>

</html>