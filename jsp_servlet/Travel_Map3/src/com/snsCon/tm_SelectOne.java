package com.snsCon;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.snsDAO.tm_snsDAO;
import com.snsDTO.tm_snsDTO;

@WebServlet("/tm_SelectOne")
public class tm_SelectOne extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int tb_seq = Integer.parseInt(request.getParameter("tb_seq"));

		tm_snsDAO dao = new tm_snsDAO();
		tm_snsDTO dto = new tm_snsDTO(tb_seq);

		dto = dao.SelectOne(tb_seq);
		if (dto != null) {
			request.setAttribute("dto", dto);
			System.out.println(" 셀렉트 원");
		} else {
			System.out.println("조회실패..");
		}
		RequestDispatcher dis = request.getRequestDispatcher("tm_View.jsp");
		dis.forward(request, response);

	}
}
