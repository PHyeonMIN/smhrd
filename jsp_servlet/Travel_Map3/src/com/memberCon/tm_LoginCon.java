package com.memberCon;

import java.io.Console;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.memberDAO.tm_memberDAO;
import com.memberDTO.tm_memberDTO;

@WebServlet("/tm_LoginCon")
public class tm_LoginCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		tm_memberDAO dao = new tm_memberDAO();
		tm_memberDTO dto = new tm_memberDTO(id, pw);

		tm_memberDTO sessiondto = dao.Login(dto);

		if (dto != null) {
			HttpSession session = request.getSession();
			session.setAttribute("dto", sessiondto);
			response.sendRedirect("tm_Main.jsp");
			System.out.println(sessiondto.getMb_id() + "로그인성공");
			System.out.println(sessiondto.getMb_follow() + "팔로우");
			System.out.println(sessiondto.getMb_follower() + "팔로워");
		} else {
			response.sendRedirect("tm_Login.jsp");
		}

	}

}
