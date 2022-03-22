package com.example;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex07Login")
public class ex07Login extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 1. 인코딩
		// 2. 파라미터 수집
		// 3. id가 smart 이고, pw 1234인지 비교
		// 4. 둘다맞다면 ex07LoginTrue.jsp, 틀렸다면 ex07LoginFalse.jsp로 이동
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		if (id.equals("smart") && pw.equals("1234")) {
			// ?변수이름 = 전달할 값 : 쿼리스트링
			response.sendRedirect("ex07LoginTrue.jsp?id=" + id);

		} else {
			response.sendRedirect("ex07LoginFalse.jsp");
		}

		// response.sendRedirect("");
		// 들어갈 수 있는 주소
		// 1. 절대경로 : http://www.naver.com --> 완전한 url
		// 2. 상대경로 : 같은 프로젝트 내 , 파일 경로
		// 같은 webContent폴더에 있으므로 파일 이름만 적어도 된다.

		// url을 이용해서 데이터를 보내는 방식
		// get : Query String 형태로 데이터를 보낸다.
		// ex07LoginTrue.jsp?보낼이름=보낼값

	}

}
