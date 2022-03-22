package com.memberCon;

import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/tm_CheckCon")
public class tm_CheckCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		tm_memberDAO dao = new tm_memberDAO();

		String mb_id = request.getParameter("id");

		boolean check = dao.Check(mb_id);

		PrintWriter out = response.getWriter();

		out.print(check);

	}

}
