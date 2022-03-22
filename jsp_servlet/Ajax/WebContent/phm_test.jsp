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
		var num_list = 1;
		var num_list2 = 2;
		<%int a= 0;%>
		
		function sum(){
			
			$.ajax({
				url : "phm_test",	//맵핑
				type : "get",
				data : {
					<%if(a==1){%>
						'phm' : 'a',
					<%}else{%>
						'phm': 'b'
					<%}%>
				},
				success : function(res){ 
					console.log(res)
				
				},
				error : function(){
					alert("요청 실패!")
				}
			
			})
		}
	
	</script>
</body>
</html>