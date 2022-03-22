package com;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/getSession")
public class getSession extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// jsessionid 내가 값을 보내는 주소
		// session 안에 값을 확인하는 방법
		// 1.client가 가진 세션을 불러온다
		HttpSession session = request.getSession();
		// 2. session에서 값을 가져오기
		String id = (String)session.getAttribute("id");
		// 형변환을 부모개념으로 형변환하면 upcast
		System.out.println(id);
		
		// 세션의 만료시기
		// 세션은 브라우저 종료시 만료된다.(단, 쿠키와는 다르게 나이와 상관없이 무조건!)
		// 나이설정을 따로 안하고 브라우저도 종료하지 않는다면 유효시간은 30분!
		// 유효시간(나이)은 개발자가 따로 설정할 수도 있다.	ex) 은행앱보면 자동으로 로그아웃시키는 기능
		
		
		PrintWriter out = response.getWriter();
		out.print(id);

	
	
	
	
	
	
	}

}
