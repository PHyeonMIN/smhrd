<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="tm_myTravelCon" method="post"
		enctype="multipart/form-data">
		
		계획
		<hr>
		<input type ='text' name ="count" value='1' style="display:none;">
		<input type ="text" name="map_seq">
		<!-- map_seq 받아오기 -->
		<br>
		<textarea cols=20 rows=10 name="travel_memo"></textarea>
		<br>
		<textarea cols=20 rows=10 name="travel_character"></textarea>
		<br> 
		<input type="file" name="travel_fileO"> 
		<br> 
		<input type="file" name="travel_fileT"> 
		<br> 
		<p id ="count">
		<select	name="travel_order">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
		</select>
		
		<br> 

		<input id="myTravel" type="submit">
	</form>
		<button onclick="test()">계획 추가</button>

	<script src="./assets/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		let count = 1;
		function test() {
			var test = document.getElementById("myTravel");
			$("#myTravel").before( "<hr>" +
					"계획" + (count+1) + "<hr>"
					+ "<input type = 'text' name = 'count' value="+(count+1)+" style=\"display:none;\"'>"
					+ "<input type = 'text' name = 'map_seq"+(count+1)+"'>"
					+ "<br>"
					+ "<textarea cols=20 rows=10 name='travel_memo"+(count+1)+"'></textarea>"
					+ "<br>"
					+ "<textarea cols=20 rows=10 name='travel_character"+(count+1)+"'></textarea>"
					+ "<br> <input type='file' name='travel_fileO"+(count+1)+"'>"
					+ "<br> <input type='file' name='travel_fileT"+(count+1)+"'>"
					+ "<br> <select id='travel_order' name='travel_order"+(count+1)+"'>"
					+ "<option value='1'>1</option>"
					+ "<option value='2'>2</option>"
					+ "<option value='3'>3</option>"
					+ "<option value='4'>4</option>"
					+ "<option value='5'>5</option>"
					+ "<option value='6'>6</option>"
					+ "<option value='7'>7</option>"
					+ "<br>")
			count++;
			console.log(count)
		}
		
		
		/*function cnt() {
			$.ajax({
				url : "tm_myTravelCon",
				type : "get",
				data : {
					"cnt" : "pppp",
				},
				success : function(res) {
				},
				error : function(){
					alert("요청 실패 !");
					}
			})
		}*/
		
	</script>



</body>
</html>