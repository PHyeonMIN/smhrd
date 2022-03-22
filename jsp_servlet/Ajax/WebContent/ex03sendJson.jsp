<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	title : <input type="text" name="title"><br>
	start : <input type="date" name="start"><br>
	end : <input type="date" name="end"><br>
	<button onClick="push()">push</button>
	<button onClick="save()">저장하기</button>



<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		let data = [];
	
		function push(){
			// 배열의 push 매서드를 이용해서 데이터를 담아두기
			data.push({
				'title' : $('input[name=title]').val(),
				'start' : $('input[name=start]').val(),
				'end' : $('input[name=end]').val()
			});
			
			console.log(data)
		}
	
	
		function save(){
			$.ajax({
				url : "ex03sendJson",	
				type : "get",
				data : {
					'json' : JSON.stringify(data) // 자바스크립트객체를 string타입으로 변환
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