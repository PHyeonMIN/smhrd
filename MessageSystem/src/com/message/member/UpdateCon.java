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
import javax.websocket.Session;

import com.message.DAO.memberDAO;
import com.message.DTO.memberDTO;

@WebServlet("/UpdateCon")
public class UpdateCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		
		memberDTO dto = (memberDTO)session.getAttribute("dto");
		String email = dto.getEmail();
		String pw = request.getParameter("pw");
		String tel = request.getParameter("tel");
		String addr = request.getParameter("address");
		
		memberDAO dao = new memberDAO();
		memberDTO dto_get = new memberDTO(email, pw, tel, addr);
		int cnt = dao.Update(dto_get);
		if(cnt>0) {
			memberDTO update_dto = new memberDTO(dto.getEmail(),tel,addr);
			session.setAttribute("dto", update_dto);
			response.sendRedirect("main.jsp");
		}
		
	
	
	
	
	
	
	
	
	
	
	}

}
