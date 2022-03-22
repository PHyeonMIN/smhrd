<%@page import="com.memberDTO.tm_memberDTO"%>
<%@page import="com.PHM_travel_mapDAO.PHM_travel_planDAO"%>
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
	<link rel="stylesheet" href="./assets/css/N4_mypage_login_1bookmark1.css" />
	<title>N4_mypage_login_1bookmark1</title>
</head>

<body>
	<%
		tm_memberDTO dto = (tm_memberDTO)session.getAttribute("dto");
		String mb_id = dto.getMb_id();
		PHM_travel_planDAO dao = new PHM_travel_planDAO();
		ArrayList<PHM_travel_mapDTO> arr1 = dao.bring_planData1(mb_id);
		/*ArrayList<PHM_travel_mapDTO> arr1 = (ArrayList<PHM_travel_mapDTO>)session.getAttribute("plan1");*/
		int end_date = 0;
		int start_date = 0;
		int total_date = 0;
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
		<div id="side_two">
			<ul>
			
				<li><button class = "side_button" onClick="location.href='N3_mypage_login_1bookmark1.jsp'">내 계획</button></li>
				<li><button class = "side_button" onClick="location.href='N3_mypage_login_2mynews.jsp'">내소식</button></li>
				<li><button class = "side_button" onClick="location.href='N3_mypage_login_3myinfo.jsp'">내정보</button></li>
			</ul>
		</div>
		<div id="side_three">
			<ul>
				<%for(int i = 0 ; i<arr1.size() ; i++) {
					end_date = Integer.parseInt(arr1.get(i).getEnd_date().substring(8));
					start_date = Integer.parseInt(arr1.get(i).getStart_date().substring(8));
					total_date = end_date - start_date+1;
				
					out.print("<li style='margin-top:0px;'><button class='travel_plan' onClick='location.href=\"my_bookmarkMove?t_title="+arr1.get(i).getTitle()+"&total_date="+total_date+"\"'>");
					out.print("<h3>"+arr1.get(i).getTitle()+"</h3>");
					out.print(arr1.get(i).getStart_date()+"~"+arr1.get(i).getEnd_date()+"</li>");
				}%>
			
				</button></li>
			</ul> 
		</div>
		<div id="side_four">
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