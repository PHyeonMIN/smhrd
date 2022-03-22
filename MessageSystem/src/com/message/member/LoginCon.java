package com.message.member;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.message.DAO.memberDAO;
import com.message.DTO.memberDTO;

/**
 * Servlet implementation class LoginCon
 */
@WebServlet("/LoginCon")
public class LoginCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");

		memberDAO dao = new memberDAO();
		memberDTO dto_up = new memberDTO(email, pw);
		//memberDAO에서 넘어오는 DTO값을 받아서
		//DTO가 null이 아니였을때는 로그인처리를 하고
		//DTO가 null이였을떄는 'LoginFalse.jsp'로 이동하게 하시오
		memberDTO dto = dao.Login(dto_up);
			
		if(dto!=null) {
			session.setAttribute("dto", dto);
			
			response.sendRedirect("main.jsp");
		}else {
			response.sendRedirect("LoginFalse.jsp");
		}

	}

}
