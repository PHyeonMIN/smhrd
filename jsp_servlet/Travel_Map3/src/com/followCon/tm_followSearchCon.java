package com.followCon;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.followDAO.tm_followDAO;
import com.google.gson.Gson;
import com.memberDTO.tm_memberDTO;

@WebServlet("/tm_followSearchCon")
public class tm_followSearchCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String search_id = request.getParameter("search_id");
		tm_followDAO dao = new tm_followDAO();

		ArrayList<tm_memberDTO> list = dao.searchMember(search_id);
		Gson gson = new Gson();
		String json = gson.toJson(list);
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print(json);
	}

}
