<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./assets/css/Login.css">
<title>Login</title>
</head>
<body>

<div class="title">
    <span>지도에서 계획을 세우다.</span>    
    <br>
    <b>My Real Travel In GwangJu</b>
    <form action="tm_LoginCon" method="post">
    <div class="user_id"><input type="text" name="id" placeholder="아이디"></div>
    <div class="user_pw"><input type="password" name="pw" placeholder="비밀번호"></div>
    <div class="user_login"><button>로그인</button></div>
    <div class="user_join"><a href = "./Join.jsp">회원가입</a></div>
    </form>
</div>


</body>
</html>