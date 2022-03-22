package com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/RemoveSession")
public class RemoveSession extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션을 삭제하는 방법
		// 1. 현재 페이지에 접근한 client의 session을 가져온다
		HttpSession session = request.getSession();
		
		// 2. session안에 지우고 싶은 값의 name을 이력
		session.removeAttribute("id");
		
		// 로그아웃할때 세션의 정보를 만료시킨다.
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	}

}
