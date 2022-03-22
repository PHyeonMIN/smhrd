<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./assets/css/Join.css">
<title>Join</title>
</head>
<body>

    <div class="join_box">
        <form action="tm_JoinCon" method="post" enctype="multipart/form-data">
        <div class="input_area">
            <label for="input_area">아이디 : </label>
            <br>
            <input type="text" name="id">
            <button type="button" id="Check" onClick="idCheck()">중복체크</button>
            <p id="result"></p>
        </div>
        <div class="input_area">
            <label for="input_area">비밀번호 :</label>
            <br>
            <input type="password" name="pw"><br> 
        </div>
        <div class="input_area">
            <label for="input_area"> 이름 :</label>
            <br>
            <input type="text" name="name"><br>
        </div>
        <div class="input_area">
            <label for="input_area">닉네임 :</label>
            <br>
            <input type="text" name="nickname"><br>
        </div>
        <div class="input_area">
            <label for="input_area">생년월일 :</label>
            <br>
        <input type="date" name="age">
        </div>
        <div class="input_area">
            <label for="input_area">성별 : </label>
            <br>
             남<input type="radio" name="gender" value="m" style="width:1.4vw; height:1.3vh;">
             여<input type="radio" name="gender" value="w" style="width:1.4vw; height:1.3vh;"><br>
            <hr>
            </div>
            <div class="input_area">
                <label for="input_area">프로필 (.jpg, .jpeg, .png)</label>
                <br><input type="file" name="file" accept=".jpg, .jpeg, .png" multiple>
            </div>
        <div class="input_area">
            <label for="input_area">이메일 :</label>
            <br><input type="text" name="email"><br>
        </div>
        <div class="input_area">
            <label for="input_area">주소 :</label>
            <br><input type="text" name="addr"><br></div>
        <div class="input_area">
            <input type="submit" name="회원가입">
        </div>

    </div>
    </form>

	<script type="text/javascript" src="assets/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		function idCheck() {
			$.ajax({
				url : "tm_CheckCon",
				type : "get",
				data : {
					"id" : $('input[name=id]').val()
				},
				success : function(res) { 
					console.log(res)

					if (res == "true") {
						$('#result').html("중복된 아이디 입니다.");
					} else {
						$('#result').html("사용가능한 아이디 입니다.");
					}

				},
				error : function() {
					alert("요청 실패 !");
				}

			})

		}
	</script>

</body>
</html>