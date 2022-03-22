package com.example;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ex02")
public class ex02 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//request.setCharacterEncoding("EUC-KR");
		
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String nick = request.getParameter("nick");
		
		
		//콘솔창에 출력되는 아래의 값들을 브라우저 창에 출력하시오
		response.setContentType("text/html;charset=EUC-KR");	// html만들기
		PrintWriter out = response.getWriter();					// 통로 만들기
		out.println("사용자가 보낸 ID값 : "+id+"<br>");
		out.println("사용자가 보낸 PW값 : "+pw);
		out.println("사용자가 보낸 NICK값 : "+nick);
		//주의 사항
		//사용자에게 입력받을 값이 있다면 실행순서
		// 1. 입력받는 HTML실행
		// 2. Servlet파일실행(자동)
		
	}

}
