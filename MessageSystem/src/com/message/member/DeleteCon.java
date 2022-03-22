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

import com.message.DAO.memberDAO;
import com.message.DTO.memberDTO;

@WebServlet("/DeleteCon")
public class DeleteCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String email = request.getParameter("delete_email");
		System.out.println(email);
		
		//member_message 테이블에서 위 email값을 삭제 후 
		//다시 'selectMember.jsp'로 이동하시오
		memberDAO dao = new memberDAO();
		int cnt = dao.Delete(email);
		if(cnt>0) {
			response.sendRedirect("selectMember.jsp");
		}
		
	
	
	
	
	
	
	
	
	}

}
