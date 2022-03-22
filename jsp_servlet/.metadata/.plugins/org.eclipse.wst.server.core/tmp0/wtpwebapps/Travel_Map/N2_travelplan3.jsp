<%@page import="com.PHM_travel_mapDTO.PHM_travel_mapDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/css/N2_travelplan3.css" />
    <title>travelplan3</title>
    
<style type="text/css">
	.plan{
		width : 10%;
	}

</style>
    
</head>

<body>

	<%
		PHM_travel_mapDTO travelplan2 = (PHM_travel_mapDTO)session.getAttribute("travelplan2");
		int start_date = Integer.parseInt(travelplan2.getStart_date().substring(8));
		int end_date = Integer.parseInt(travelplan2.getEnd_date().substring(8));
		int total_date = end_date - start_date + 1;
	%>

	<div id="day_location" style="display:none;"></div>
	<div id="side_bar">
		<b>My Real Travel in GwangJu </b>
		<button onClick="location.href='tm_LogoutCon'">로그아웃</button>
	</div> 
    <div id="side_all">
        <div id="side_one">
            <nav>
                <ul class="side_menu">
                    <!-- onClick="window.location.reload()" -->
                    <li><button type="button" class = "side_button" onClick="location.href='N1_main.jsp'"><a href="#" >검색</a></button></li>
                    <li><button type="button" class = "side_button" onClick="location.href='N2_travelplan1.jsp'"><a href="#" >여행계획</a></button></li>
                    <li><button type="button" class = "side_button" onClick="location.href='N3_mypage_login_1bookmark1.jsp'"><a href="#" >My</a></button></li>
                    <li><button type="button" class = "side_button" onClick="location.href='N5_sns.jsp'"><a href="#" >SNS</a></button></li>
                </ul>
            </nav>
        </div>
        <div id="side_two" style="height:10%;">
        	
        	<input type="text" id="search_keyword_query" placeholder="검색어 입력">
            <button type="button" id="search_keyword_query_button"><img src="./img/search.png"></button>
        </div>
        <div id="side_three" style="height:25%;">
			<table class="plan_table_one" align="center">
				<caption><h3>여행지 즐겨찾기 목록</h3></caption>
				<colgroup >
					<col style="width: 5%;">
					<col style="width: 30%;">
					<col style="width: 32.5%;">
					<col style="width: 18.5%;">
					<col style="width: 14%;">
				</colgroup>
				<tbody id="after"></tbody>
			</table>
			

        </div>
        <div id="day_add" align = "center" style="margin:10px;">
        	<%for(int i=0; i<total_date; i++) {%>
			 	<button type="button" class="side_button" onClick="day_plan(<%=total_date %>,<%=i+1%>)"><%=i+1%>일차</button>
        	<%}%>
        </div>
        
        
        <form action="travelplan3Con_send_data">
        <div id="side_four" style="height:42%;">
        <%for(int j = 0; j<total_date; j++) { 
        	if(j==0){%>
			<table class="plan_table_one" id="plan1" style="display:inline;">
				<colgroup>
					<col style="width: 40px;">
					<col style="width: 150px;">
					<col style="width: 62.5px;">
					<col style="width: 62.5px;">
					<col style="width: 100px;">
					<col style="width: 40px;">
				</colgroup>
				<thead>
				<tr>
					<td>순서</td>
					<td>여행지명</td>
					<td>도착시간</td>
					<td>출발시간</td>
					<td>메모</td>
				</tr>
				</thead>
				<tbody id="table_add_1" >
				</tbody>
			</table>
			<%} else{%>
			<table class="plan_table_one" id="plan<%=j+1 %>" style="display:none;">
				<colgroup>
					<col style="width: 40px;">
					<col style="width: 150px;">
					<col style="width: 62.5px;">
					<col style="width: 62.5px;">
					<col style="width: 80px;">
					<col style="width: 60px;">
				</colgroup>
				<thead>
				<tr>
					<td>순서</td>
					<td>여행지명</td>
					<td>도착시간</td>
					<td>출발시간</td>
					<td>메모</td>
				</tr>
				</thead>
				<tbody id="table_add_<%=j+1 %>" >
				</tbody>
			</table>
				<%}
			}%>
		</div>
		
		
		<div id="side_five" align="center">
		</div>
		<div id="side_six" align="center" style="margin-top:20px;">
				<button	type="button" class="side_button" onClick="kakao_route()" style="width:110px; margin-right:10px;">지도 미리보기</button>
				<button type="button" class="side_button" onClick="tmap_route()" style="width:110px; margin-right:10px;">경로 미리보기</button>
				<button type="submit" class="side_button" style="width:100px;">계획 세우기</button>
		</div>
		</form>
   	</div>
	
<!-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->    
	<div id="kakao_map" style="width: 73.3%; height: 100vh; float: right;"></div>
	<div id="tmap_map" style="width: 73.3%; height: 100vh; float: right; display:none;"></div>
	
	<script src="./assets/js/jquery-3.6.0.min.js"></script>
	
	<script type="text/javascript">
		//여행지 즐겨찾기 목록 파트
		var day = 1;
		
		$.ajax({
				url : "favorite_bringCon",
				type : "get",
				data : {
				},
				dataType : "json",
				success : function(res1){ 
					//console.log(res)
					
					let add_tag1 ="";
					for(let a = 0; a < res1.length ; a++){
						add_tag1 += "<tr><td>"+(a+1)+"</td>";
						add_tag1 += "<td>"+res1[a].map_name+"</td>";
						add_tag1 += "<td>"+res1[a].map_addr+"</td>";
						add_tag1 += "<td><button type='button' onClick=\"add_plan(\'"+res1[a].map_name+"\')\">계획에 넣기</button></td>";
						add_tag1 += "<td><button type='button' onClick=\"favorite_remove(\'"+res1[a].map_name+"\')\">삭제하기</button></td></tr>";
					}
					$('#after').append(add_tag1);
					
				},
				error : function(){
					alert("요청 실패!")
				}
			
			})
		function favorite_remove(map_name1){
			$.ajax({
				url : "favorite_removeCon",	
				type : "get",
				data : {
					"map_name" : map_name1
				},
				dataType:"json",
				success : function(res2){ 
					
					//console.log(res)
					$('#after').html('');
					add_tag2 ="";
					for(let b = 0; b < res2.length ; b++){
						add_tag2 += "<tr><td>"+(b+1)+"</td>";
						add_tag2 += "<td>"+res2[b].map_name+"</td>";
						add_tag2 += "<td>"+res2[b].map_addr+"</td>";
						add_tag2 += "<td><button type='button' onClick=\"add_plan(\'"+res2[b].map_name+"\')\">계획에 넣기</button></td>";
						add_tag2 += "<td><button type='button' onClick=\"favorite_remove(\'"+res2[b].map_name+"\')\">삭제하기</button></td></tr>";
					}	
					$('#after').append(add_tag2);
					
				},
				error : function(){
					alert("요청 실패!")
				}
			
			})
		}
	</script>
	<script>
		// 계획에 넣기 파트
		//var loc = $('#day_location').text();
		/*for(let i=0; i<location.length ; i++){
			let plan_list=[];
		}*/
		//var cnt=0;
		
		//let day_schedule=[];
		
		let plan_list_position=[];
		let latitude = "";
		let longtitude = "";
		
		var plan_list=[];
		var plan_list1=[];
		var plan_list2=[];
		var plan_list3=[];
		var plan_list4=[];
		var plan_list5=[];
		var plan_list6=[];
		// 카카오맵 관련
		var positions=[];
		var positions1=[];
		var positions2=[];
		var positions3=[];
		var positions4=[];
		var positions5=[];
		var positions6=[];
		
		function add_plan(map_name2){
			$.ajax({ 
				url : "add_Plan",	
				type : "get",
				data : {
					"map_name":map_name2
				},
				dataType : "json",
				success : function(res3){ 
					//console.log("res :",res);
					if(day==1){
						plan_list1.push(res3);
						positions1.push({title: res3.map_name, 
					        latlng: new kakao.maps.LatLng(res3.map_latitude, res3.map_longtitude)});
						latitude = res3.map_latitude;
						longtitude = res3.map_longtitude;
						print_plan(plan_list1);
						panTo();
						//displayMarker(positions1,day);
						displayMarker(res3.map_name, new kakao.maps.LatLng(res3.map_latitude, res3.map_longtitude), day);
					}else if(day==2){
						plan_list2.push(res3);
						positions2.push({title: res3.map_name, 
					        latlng: new kakao.maps.LatLng(res3.map_latitude, res3.map_longtitude)});
						latitude = res3.map_latitude;
						longtitude = res3.map_longtitude;
						print_plan(plan_list2);
						panTo();
						//displayMarker(positions2,day);
						displayMarker(res3.map_name, new kakao.maps.LatLng(res3.map_latitude, res3.map_longtitude), day);
					}else if(day==3){
						plan_list3.push(res3);
						positions3.push({title: res3.map_name, 
					        latlng: new kakao.maps.LatLng(res3.map_latitude, res3.map_longtitude)});
						latitude = res3.map_latitude;
						longtitude = res3.map_longtitude;
						print_plan(plan_list3);
						panTo();
						//displayMarker(positions3,day);
						displayMarker(res3.map_name, new kakao.maps.LatLng(res3.map_latitude, res3.map_longtitude), day);
					}else if(day==4){
						plan_list4.push(res3);
						positions4.push({title: res3.map_name, 
					        latlng: new kakao.maps.LatLng(res3.map_latitude, res3.map_longtitude)});
						latitude = res3.map_latitude;
						longtitude = res3.map_longtitude;
						print_plan(plan_list4);
						panTo();
						//displayMarker(positions4,day);
						displayMarker(res3.map_name, new kakao.maps.LatLng(res3.map_latitude, res3.map_longtitude), day);
					}else if(day==5){
						plan_list5.push(res3);
						positions5.push({title: res3.map_name, 
					        latlng: new kakao.maps.LatLng(res3.map_latitude, res3.map_longtitude)});
						latitude = res3.map_latitude;
						longtitude = res3.map_longtitude;
						print_plan(plan_list5);
						panTo();
						//displayMarker(positions5,day);
						displayMarker(res3.map_name, new kakao.maps.LatLng(res3.map_latitude, res3.map_longtitude), day);
					}else if(day==6){
						plan_list6.push(res3);
						positions6.push({title: res3.map_name, 
					        latlng: new kakao.maps.LatLng(res3.map_latitude, res3.map_longtitude)});
						latitude = res3.map_latitude;
						longtitude = res3.map_longtitude;
						print_plan(plan_list6);
						panTo();
						//displayMarker(positions6,day);
						displayMarker(res3.map_name, new kakao.maps.LatLng(res3.map_latitude, res3.map_longtitude), day);
					}
					
					
					/*positions.push({title: res.map_name, 
				        latlng: new kakao.maps.LatLng(res.map_latitude, res.map_longtitude)});
					
					latitude = res.map_latitude;
					longtitude = res.map_longtitude;
					//console.log("latitude: ",latitude);
					//console.log("longtitude: ",longtitude);
				    //console.log(positions);
					//console.log(plan_list);
					
					
					panTo();
					displayMarker(positions);*/
					
				},
				error : function(){
					alert("요청 실패!")
				}
			
			})
		}
		
		function print_plan(plan_list_a){
			$('#table_add_'+day+'').html('');
			let add_tag3 = "";
			for(let c = 0; c<plan_list_a.length ; c++){
					
					add_tag3+="<tr><td>"+(c+1)+"</td>";
					add_tag3+="<td>"+plan_list_a[c].map_name+"</td>";
					add_tag3+="<td><input name='"+day+"_"+(c+1)+"_startTime' type='time'></td>";
					add_tag3+="<td class='plan'><input name='"+day+"_"+(c+1)+"_endTime' type='time'></td>";
					add_tag3+="<td class='memodo"+(c+1)+" plan'><button type='button' onClick='memo2("+(c+1)+")' style='font-size:12px;'>메모하기</button></td>";
					add_tag3+="<td class='plan'><button type='button' onClick='remove_plan(\""+plan_list_a[c].map_name+"\","+day+")'>삭제</button></td></tr>";
					add_tag3+="<tr align='right'>";
					add_tag3+="<td colspan='6' class='textarea"+(c+1)+"'><textarea name='"+day+"_"+(c+1)+"_memo' class='text"+(c+1)+"' style='display:none; width:400px;'></textarea></td></tr>";
					
					add_tag3+="<tr><td colspan='6' style='display:none;'><input name='"+day+"_"+(c+1)+"_day' type='text' value='"+day+"'	style='display:noen;'>";
					add_tag3+="<input name='"+day+"_"+(c+1)+"_cnt' type='text' value='"+(c+1)+"' style='display:noen;'>";
					add_tag3+="<input name='"+day+"_"+(c+1)+"_map_name' type='text' value='"+plan_list_a[c].map_name+"' style='display:noen;'></td></tr>";
			
			
			
			
			}
			$('#table_add_'+day+'').append(add_tag3);
		}
	
	</script>
	<script type="text/javascript">
	 	
		// 일차별로 계획 만들기 파트
		function day_plan(total_length_a, d){
			
			for(let e=1; e<total_length_a +1 ; e++){
				if(e==d){
					$('#plan'+d+'').css('display','inline');
				}else{
					$('#plan'+e+'').css('display','none');
				}
			}
			day=d;
			if(d==1){
				displayMarker2(positions1,d);
				marker_allClose(markers2,2);
				marker_allClose(markers3,3);
				marker_allClose(markers4,4);
				marker_allClose(markers5,5);
				marker_allClose(markers6,6);
				drawLine_allClose(drawLine_list);
				distanceOverlay_allClose(distanceOverlay_list);
				tmap_allClose();
				tmap_poly_allClose();
			}else if(d==2){
				displayMarker2(positions2,d);
				marker_allClose(markers1,1);
				marker_allClose(markers3,3);
				marker_allClose(markers4,4);
				marker_allClose(markers5,5);
				marker_allClose(markers6,6);
				drawLine_allClose(drawLine_list);
				distanceOverlay_allClose(distanceOverlay_list)
				tmap_allClose();
				tmap_poly_allClose();
				
			}else if(d==3){
				displayMarker2(positions3,d);
				marker_allClose(markers1,1);
				marker_allClose(markers2,2);
				marker_allClose(markers4,4);
				marker_allClose(markers5,5);
				marker_allClose(markers6,6);
				drawLine_allClose(drawLine_list);
				distanceOverlay_allClose(distanceOverlay_list);
				tmap_allClose();
				tmap_poly_allClose();
			}else if(d==4){
				displayMarker2(positions4,d);
				marker_allClose(markers1,1);
				marker_allClose(markers2,2);
				marker_allClose(markers3,3);
				marker_allClose(markers5,5);
				marker_allClose(markers6,6);
				drawLine_allClose(drawLine_list);
				distanceOverlay_allClose(distanceOverlay_list);
				tmap_allClose();
				tmap_poly_allClose();
			}else if(d==5){
				displayMarker2(positions5,d);
				marker_allClose(markers1,1);
				marker_allClose(markers2,2);
				marker_allClose(markers3,3);
				marker_allClose(markers4,4);
				marker_allClose(markers6,6);
				drawLine_allClose(drawLine_list);
				distanceOverlay_allClose(distanceOverlay_list);
				tmap_allClose();
				tmap_poly_allClose();
			}else if(d==6){
				displayMarker2(positions6,d);
				marker_allClose(markers1,1);
				marker_allClose(markers2,2);
				marker_allClose(markers3,3);
				marker_allClose(markers4,4);
				marker_allClose(markers5,5);
				drawLine_allClose(drawLine_list);
				distanceOverlay_allClose(distanceOverlay_list);
				tmap_allClose();
				tmap_poly_allClose();
			}
		}
	
	</script>
	<script type="text/javascript">	
		//메모기능 파트
		function close_memo(g){
			$('.text'+g+'').hide();
			$('.memodo'+g+'').html("<button type='button' onClick='memo2("+g+")' style='font-size:12px;'>메모하기</button>")
		}
		function memo2(h){
			$('.text'+h+'').show();
			$('.memodo'+h+'').html("<button type='button' onClick='close_memo("+h+")' style='font-size:12px;'>메모닫기</button>")
		}
		
		
		
		function remove_plan(map_name2,k){
			console.log(1)
			if(k==1){
				for(let i = 0; i < plan_list1.length; i++) {
				  if(plan_list1[i].map_name === map_name2)  {
					    plan_list1.splice(i, 1);
				  }
				}
				for(let i = 0; i < positions1.length; i++) 	{
					  if(positions1[i].title === map_name2){
						  	marker_close(i,markers1);
						   	positions1.splice(i, 1);
						   	
					  }
					}
				//remove_plan2(plan_list1);
				print_plan(plan_list1);
			}
			else if(k==2){
				for(let i = 0; i < plan_list2.length; i++) {
				  if(plan_list2[i].map_name === map_name2)  {
					    plan_list2.splice(i, 1);
				  }
				  for(let i = 0; i < positions2.length; i++) 	{
					  if(positions2[i].title === map_name2){
						  	marker_close(i,markers2);
						   	positions2.splice(i, 1);
					  }
					}
				  //remove_plan2(plan_list2);
				  print_plan(plan_list2);
				}
			}else if(k==3){
				for(let i = 0; i < plan_list3.length; i++) {
					if(plan_list3[i].map_name === map_name2)  {
						    plan_list3.splice(i, 1);
					  }
					}
				for(let i = 0; i < positions3.length; i++) 	{
					  if(positions3[i].title === map_name2){
							marker_close(i,markers3);
						   	positions3.splice(i, 1);
					  }
					}
				  //remove_plan2(plan_list3);
					print_plan(plan_list3);
				}
			else if(k==4){
				for(let i = 0; i < plan_list4.length; i++) {
					  if(plan_list4[i].map_name === map_name2)  {
						    plan_list4.splice(i, 1);
					  }
					}
				for(let i = 0; i < positions4.length; i++) 	{
					  if(positions4[i].title === map_name2){
							marker_close(i,markers4);
						   	positions4.splice(i, 1);
					  }
					}
				//remove_plan2(plan_list4);
				print_plan(plan_list4);
				}
			else if(k==5){
				for(let i = 0; i < plan_list5.length; i++) {
					  if(plan_list5[i].map_name === map_name2)  {
						    plan_list5.splice(i, 1);
					  }
					}
				for(let i = 0; i < positions5.length; i++) 	{
					  if(positions5[i].title === map_name2){
							marker_close(i,markers5);
						   	positions5.splice(i, 1);
					  }
					}
				//remove_plan2(plan_list5);
				print_plan(plan_list5);
				}
			else if(k==6){
				for(let i = 0; i < plan_list6.length; i++) {
					  if(plan_list6[i].map_name === map_name2)  {
						    plan_list6.splice(i, 1);
					  }
					}
				for(let i = 0; i < positions6.length; i++) 	{
					  if(positions6[i].title === map_name2){
							marker_close(i,markers6);
						   	positions6.splice(i, 1);
					  }
					}
				//remove_plan2(plan_list6);
				print_plan(plan_list6);
				}
			/*for(let i = 0; i < positions.length; i++) 	{
			  if(positions[i].map_name === map_name){
				   	posiotions.splice(i, 1);
			  }
			}*/
			
		}
		
		/*function remove_plan2(plan_list){
			$('#table_add_'+day+'').html('');
			let add_tag2 = "";
			for(let i = 0; i<plan_list.length ; i++){
				add_tag2+="<tr><td>"+(i+1)+"</td>";
				add_tag2+="<td>"+plan_list[i].map_name+"</td>";
				add_tag2+="<td><input type='time'></td>";
				add_tag2+="<td><input type='time'></td>";
				add_tag2+="<td class='memodo"+(i+1)+"'><button type='button' onClick='memo("+(i+1)+")' style='font-size:12px; >메모하기</button></td>";
				add_tag2+="<td><button type='button' onClick='remove_plan('"+plan_list[i].map_name+"' ,"+day+")'>삭제</button></td></tr>";
				add_tag2+="<tr align='right'>";
				add_tag2+="<td colspan='6' class='textarea"+(i+1)+"'><textarea class='text"+(i+1)+"' style='display:none; width:400px;'></textarea></td></tr>";
			}
			$('#table_add_'+day+'').append(add_tag2)
		}*/
		
		
	</script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=31e189d0d305a85663770a625b11688d&libraries=services"></script>
	<script type="text/javascript">
	
		var mapContainer = document.getElementById('kakao_map'); // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(35.11070531999631,
					126.87780481325912), // 지도의 중심좌표 - 스마트인재개발원
			level : 3,	// 지도의 확대 레벨
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
		
		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		var markers = [];
		var markers1 = [];
		var markers2 = [];
		var markers3 = [];
		var markers4 = [];
		var markers5 = [];
		var markers6 = [];
		
		function displayMarker(title, positions, day) {
			//for (var i = 0; i < positions.length; i ++) {
			    
			    // 마커 이미지의 이미지 크기 입니다
			    var imageSize = new kakao.maps.Size(24, 35); 
			    
			    // 마커 이미지를 생성합니다    
			    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
			    
			    // 마커를 생성합니다
			    var marker = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: positions, // 마커를 표시할 위치
			        title : title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			        image : markerImage, // 마커 이미지 
			        level:3
			    });
			   
			    
			//}
			 if(day==1){
			    	markers1.push(marker);
			    }else if(day==2){
			    	markers2.push(marker);
			    }else if(day==3){
			    	markers3.push(marker);
			    }else if(day==4){
			    	markers4.push(marker);
			    }else if(day==5){
			    	markers5.push(marker);
			    }else if(day==6){
			    	markers6.push(marker);
			    }
		}
		

		function displayMarker2(positions,day) {
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
			   
			    if(day==1){
			    	markers1.push(marker);
			    }else if(day==2){
			    	markers2.push(marker);
			    }else if(day==3){
			    	markers3.push(marker);
			    }else if(day==4){
			    	markers4.push(marker);
			    }else if(day==5){
			    	markers5.push(marker);
			    }else if(day==6){
			    	markers6.push(marker);
			    }
			    
			}
		}
		
		
		function marker_allClose(marker_del,del){
			//console.log(markers)
			//console.log("포지션 길이 : ",positions.length)
			//console.log("포지션 : ",positions)
			
			for(let i =0; i<marker_del.length; i++){
				marker_del[i].setMap(null);
				console.log(i,marker_del[i]);
			}
			console.log("마커 : ",marker_del)
			if(del==1){
		    	markers1=[];
		    }else if(del==2){
		    	markers2=[];
		    }else if(del==3){
		    	markers3=[];
		    }else if(del==4){
		    	markers4=[];
		    }else if(del==5){
		    	markers5=[];
		    }else if(del==6){
		    	markers6=[];
		    }
						
			
		}
		function marker_close(del2,marker_del2){
			//console.log("i",i)
			//console.log("markers1",markers);
			marker_del2[del2].setMap(null);
			
			marker_del2.splice(del2, 1);
			//console.log("markers2",markers);
			console.log("positions1",positions1)
			
			
		}
		
	</script>
	
	<script type="text/javascript">
		// 지도 미리보기 파트(카카오맵) 
		var drawLine_list = [];
		var distanceOverlay_list = [];
		function kakao_route(){
			drawLine_allClose(drawLine_list);
			document.getElementById('kakao_map').style.display="block";
			document.getElementById('tmap_map').style.display="none";
			var distanceOverlay;
			var linePath;
			var lineLine = new kakao.maps.Polyline();
			var distance;
			if(day==1){
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
			}
			
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
	</script>
	
	<script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xxefc4aaf819ab46d09bfedeef6adff714"></script>
	<script type="text/javascript">
		 // 1. 지도 띄우기
		/*map1 = new Tmapv2.Map("tmap_map", {
			center: new Tmapv2.LatLng(35.1599801229349, 126.85227886055003),
		});
		map1.setZoom(14);  */
	</script>
	<script>
		// 지도 경로미리보기 파트(티맵)
		var tmap_markers =[];
		var new_polyLine = [];
		var map1 = null;
		function tmap_route(){
			
			if(day==1){
				plan_list = plan_list1;
			}else if(day==2){
				plan_list = plan_list2;
			}else if(day==3){
				plan_list = plan_list3;
			}else if(day==4){
				plan_list = plan_list4;
			}else if(day==5){
				plan_list = plan_list5;
			}else if(day==6){
				plan_list = plan_list6;
			}
			console.log("plan_list",plan_list)
			// 1. 지도 띄우기
			
			document.getElementById('kakao_map').style.display="none";
				document.getElementById('tmap_map').style.display="block";
			
			//map1 = null;
			if(map1==null){
			map1 = new Tmapv2.Map("tmap_map", {
				center: new Tmapv2.LatLng(35.1599801229349, 126.85227886055003),
			});
			map1.setZoom(14);
			}
			
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
					//async:false,
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
					/* var newData = geoData[0];
					PTbounds = new Tmapv2.LatLngBounds();
							for (var i = 0; i < newData.length; i++) {
								var mData = newData[i];
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
						map1.fitBounds(PTbounds); */
				
					},
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
			for(let i =0; i<new_polyLine.length; i++){
				new_polyLine[i].setMap(null);
			}
			new_polyLine=[];
		}
		
		
	</script>

</body>

</html>