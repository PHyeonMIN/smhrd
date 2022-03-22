<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	// 세션으로부터 id값 꺼내오기
	// Session에 저장될 때, java.lang.Object : 최상위 클래스로 저장된다
	// 부모(Object)타입으로 변환되서 저장이 된다.
	// 꺼내서 변수에 다시 담아줄때, 다운캐스팅(명시적형변환)
	String id = (String)session.getAttribute("id");
	
	// 로그인 성공 : 세션에 값이 담겨있지만
	// 로그인 실패 : 세션에 값이 없음 --> getAttribute로 꺼내오면 null
	if(id!=null){
		out.print("<h1>"+id+"님 환영합니다.</h1>");
	}
	else{
		out.print("<h1>회원관리메인페이지</h1>");
	}





%>
	
	<a href="Join.html"><button>회원입력</button></a>
	<a href="Delete.html"><button>회원삭제</button></a>
	<a href="Update.html"><button>회원수정</button></a>
	<a href="Select.html"><button>회원검색</button></a>
	<a href="SelectAll.jsp"><button>회원전체검색</button></a>
	<%
		if(id!=null){
			out.print("<a href='LogOut'><button>로그아웃</button></a>");
			
		}
		else{
			out.print("<a href='Login.html'><button>로그인</button></a>");
		}
	 %>
</body>
</html>