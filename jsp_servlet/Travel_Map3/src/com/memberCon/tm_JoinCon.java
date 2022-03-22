package com.memberCon;

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

import com.memberDAO.tm_memberDAO;
import com.memberDTO.tm_memberDTO;

@WebServlet("/tm_JoinCon")
public class tm_JoinCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String mb_id = request.getParameter("id");
		String mb_pw = request.getParameter("pw");
		String mb_name = request.getParameter("name");
		int mb_age = Integer.parseInt(request.getParameter("age"));
		String mb_gender = request.getParameter("gender");
		String mb_email = request.getParameter("email");
		String mb_addr = request.getParameter("addr");
		String mb_img = ""; 
		String mb_nickname = request.getParameter("nickname");
		int mb_follow = 0;
		int mb_follower = 0;
		String admin_yn = "n";

		tm_memberDTO dto = new tm_memberDTO(mb_id, mb_pw, mb_name,mb_age, mb_gender, mb_email, mb_addr, mb_img, mb_nickname, mb_follow,
				mb_follower, admin_yn);
		tm_memberDAO dao = new tm_memberDAO();

		int cnt = dao.Join(dto);

		request.setCharacterEncoding("utf-8");

		if (cnt > 0) {
			System.out.println("가입성공");
			response.sendRedirect("tm_Main.jsp");
		} else {
			System.out.println("가입실패");

		}

	}

}
