package com.message.member;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.message.DAO.memberDAO;
import com.message.DTO.memberDTO;

@WebServlet("/JoinCon")
public class JoinCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String tel = request.getParameter("tel");
		String addr = request.getParameter("addr");
		
		memberDAO dao = new memberDAO();
		memberDTO dto = new memberDTO(email, pw, tel, addr);
		int cnt = dao.Join(dto);
		
		// 1. memberDAO에 해당하는 기능메소드로 값 보내주기(객체생성, 메소드, 매개변수)
		// 2. cnt값 리턴해주기(메소드, 리턴)
		
		if (cnt > 0) {
			// 두페이지에서만 정보공유
			request.setAttribute("dto", dto);	
			RequestDispatcher dis = request.getRequestDispatcher("joinSuccess.jsp");
			dis.forward(request, response); 
			// 1. request에 회원정보 저장
			// 2. jsp으로 이동하겠다
			// 3. 이동을 할때 현재 페이지의 request와 response를 같이 가지고 이동하겠다.
			
			// 왜 request영역을 쓰냐?
			// 정보를 딱 한번쓰고 사라져도 상관없어서 - 두가지 페이지에서만 정보를 주고 받을 때
			
			
			
			
			//JoinCon에서 joinSuccess.jsp로 값을 보낼 수 있는 두가지 방법
			// 1. 세션활용
			// 2. QueryString 활용
		}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	}
	
}
