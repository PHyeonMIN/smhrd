<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	num1 : <input type="text" name="num1"> <br>
	num2 : <input type="text" name="num2"> <br>
	
	<button onclick="sum()">더하기</button>
	<hr>
	<!-- 결과값 -->
	<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		function sum(){
			$.ajax({
				url : "ex01sum",	//맵핑
				type : "get",
				// javascript 객체 형식 : {보낼이름 : 값}
				// input[속성=속성값]
				data : {
					"num1" : $('input[name=num1]').val(),
					"num2" : $('input[name=num2]').val()
					
				},
				success : function(res){ // 서버에 요청한 결과가 매개변수안에 담김
					console.log(res)
					
					// $('선택자').after(html/text) --> 선택된 선택자 바로 다음에 코드를 추가
					// $('선택자').before(html/text) --> 선택된 선택자의 바로 이전에 코드를 추가
					$('hr').after(res);
					// $('선택자').html() --> 매개변수에 안넣으면 내부의 html코드를 모두 반환
					// $('선택자').html(html/text) --> 내부의 html코드가 수정
					
					// $('선택자').append(html/text) --> 내부의 html코드를 추가
					// ex) $('body').append("<div></div>");
				},
				error : function(){
					alert("요청 실패!")
				}
			
			})
		}
	
	</script>
</body>
</html>