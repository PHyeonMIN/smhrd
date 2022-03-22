package com.snsCon;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.snsDAO.tm_snsDAO;
import com.snsDTO.tm_snsDTO;

@WebServlet("/tm_imgSelect")
public class tm_imgSelect extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		tm_snsDAO dao = new tm_snsDAO();

		ArrayList<tm_snsDTO> list = dao.selectAll();

		if (list != null) {
			request.setAttribute("list", list);
			System.out.println("이미지 셀렉트");
		} else {
			System.out.println("비었습니다 이미지 셀렉트");
		}

		RequestDispatcher dis = request.getRequestDispatcher("tm_Board.jsp");
		dis.forward(request, response);

	}
}
