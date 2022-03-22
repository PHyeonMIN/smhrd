<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="tm_snsCon" method="post" enctype="multipart/form-data">
		<div>
		<input type ="text" name="tb_title" placeholder = "tb_title"><hr>
		<textarea cols=50 rows =30 name="tb_content" placeholder = "tb_content"></textarea><hr>
		<label for="file">이미지 첨부</label> 
		<input type="file" id="file" name="file" accept=".jpg, .jpeg, .png" multiple><hr>
		</div>
		
		<div>
			<button>제출</button>    
		</div>
	</form>


	<script type="text/javascript" src="assets/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		
	</script>

</body>
</html>

