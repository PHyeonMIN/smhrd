package com.example;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex06")
//
public class ex06 extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
//		String pw2 = request.getParameter("pw_confirm");
		String gender = request.getParameter("gender");
		String blood = request.getParameter("blood");
		String birth = request.getParameter("birth");
		String[] hobby = request.getParameterValues("hobby");
		String hobby_res = "";
		for (int i = 0; i < hobby.length; i++) {
			hobby_res += hobby[i]+" ";
		}
		String color = request.getParameter("color");
		String tex = request.getParameter("tex");
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println(id+"<br>");
		out.println(pw+"<br>");
//		out.println(pw2+"<br>");
		out.println(gender+"<br>");
		out.println(blood+"<br>");
		out.println(birth+"<br>");
		out.println(hobby_res+"<br>");
		out.println(color+"<br>");
		out.println(tex+"<br>");
		
	}

}
