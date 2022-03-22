<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<button onClick="dataLoad()">데이터 가져오기</button>
	
	<table border="1">
		<thead>
			<tr>
				<td>이메일</td>
				<td>전화번호</td>
				<td>주소</td>
			</tr>
		</thead>
		<tbody id="tbody">
			
		</tbody>
	</table>
	<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		function dataLoad(){
			$.ajax({
				url : "ex02Gson",
				type : "get",		//JSON 데이터를 가져오기만
				//data : {},
				dataType : 'json', // JSON 데이터를 가져올떄, json으로 지정해야함(아니면 String으로 받음)
				success : function(res){ 
					console.log(res)
					
					$('#tbody').html('');	//tbody의 html코드를 초기화
					
					// 태그 만들기
					let table ='';
					for(let i = 0; i<res.length; i++){
						table +='<tr>';
						table +='<td>'+ res[i].email +'</td>';
						table +='<td>'+ res[i].tel +'</td>';
						table +='<td>'+ res[i].address +'</td>';
						table +='</tr>';
					}
					
					// javascript 코드로 html 태그 삽임
					// .html()
					// .after()
					// .before()
					// .append() --> 선택한 태그 내부에 추가
					$('#tbody').append(table)
					
				},
				error : function(){
					alert("요청 실패!")
				}
			
			});
		}
	
	</script>
	
	
	
</body>
</html>