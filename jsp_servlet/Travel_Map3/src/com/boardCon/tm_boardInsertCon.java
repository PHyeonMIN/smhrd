package com.boardCon;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.boardDAO.tm_boardDAO;
import com.boardDTO.tm_boardDTO;
import com.memberDTO.tm_memberDTO;

@WebServlet("/tm_boardInsertCon")
public class tm_boardInsertCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		tm_memberDTO m_dto = (tm_memberDTO) session.getAttribute("dto");
		String mb_id = m_dto.getMb_id();
		System.out.println(mb_id+ "보드 인서트 서블릿");
		String tb_title = request.getParameter("tb_title");
		String tb_content = request.getParameter("tb_content");

		tm_boardDTO dto = new tm_boardDTO();
		dto.setMb_id(mb_id);
		dto.setTb_title(tb_title);
		dto.setTb_content(tb_content);

		tm_boardDAO dao = new tm_boardDAO();
		dao.boardInsert(dto);

		response.sendRedirect("tm_BoardList.jsp");
	}

}
