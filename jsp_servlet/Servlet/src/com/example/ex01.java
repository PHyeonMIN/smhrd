package com.example;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex01")

public class ex01 extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Servlet : Server + Applet
		// 서버를 만드는 서버프로그래밍 페이지
		// Java -> main()Hello / Servlet -> service()
		// 내 IP 주소 : 172.30.1.27

		System.out.println("누군가 접속했다.");

		// request : 서버에 접속하는 사용자의 정보가 담겨있는 객체
		String ip = request.getRemoteAddr();
		System.out.println("접속한 사용자의 IP : " + ip);

		// response : 서버가 사용자에게 응답할 수 있게 해주는 객체
		// 1. html을 만들어줌
		response.setContentType("text/html;charset=utf-8");
		// 문자로만들어진 html
		// 2. 통로를 만들어줌
		PrintWriter out = response.getWriter();
		
		
		
		out.print("Hello");
		// 접속한 IP가 '172.30.1.17' 였을때는
		// "선생님 환영합니다" 출력
		if (ip.equals("172.30.1.35")) {
			out.println("선생님 환영합니다.");
		}
		// 접속한 IP가 팀원이었을때
		// "팀원"환영합니다"출력
		else if (ip.equals("172.30.1.47") || ip.equals("172.30.1.48")){
			out.println("30까지 한달남으셨습니다 ㅎㅎ");
		}
		else if(ip.equals("172.30.1.38")){
			out.println("병원 얼른가시죠");
		}
		else {
			out.println("손님 환영합니다.");
		}
	}

}
