package com.followCon;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.followDAO.tm_followDAO;
import com.google.gson.Gson;
import com.memberDTO.tm_memberDTO;

@WebServlet("/tm_followCheckCon")
public class tm_followCheckCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		response.setCharacterEncoding("utf-8");

		tm_memberDTO dto = (tm_memberDTO) session.getAttribute("dto");
		tm_followDAO dao = new tm_followDAO();

		ArrayList<String> list = dao.followCheck(dto);

		Gson gson = new Gson();
		String json = gson.toJson(list);
		PrintWriter out = response.getWriter();
		out.print(json);
	}

}
