package com.followCon;

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

import com.followDAO.tm_followDAO;
import com.followDTO.tm_followDTO;
import com.memberDAO.tm_memberDAO;
import com.memberDTO.tm_memberDTO;

@WebServlet("/tm_followCon")
public class tm_followCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		tm_followDAO follow_dao = new tm_followDAO();
		tm_memberDAO dao = new tm_memberDAO();

		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		tm_memberDTO dto = (tm_memberDTO) session.getAttribute("dto");
		String f_id = request.getParameter("f_id");
		String mb_id = dto.getMb_id();

		tm_followDTO follow_dto = new tm_followDTO(f_id, mb_id);
		System.out.println(mb_id + "followCon");
		System.out.println(f_id);

		int follow_cnt = follow_dao.follow(follow_dto);

		if (follow_cnt > 0) {

			dao.followIncrease(mb_id);
			dao.followerIncrease(f_id);

		}

	}

}
