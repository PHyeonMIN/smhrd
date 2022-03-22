package com.example;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/homework") //com.example.homework.java
//URL Mapping : URL어려워지고, 보안 취약해지기 떄문에
public class homework extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			int num = Integer.parseInt(request.getParameter("num"));
			
			response.setContentType("text/html;charset=EUC-KR");
			PrintWriter out = response.getWriter();
			out.print("<table border='1'>");
			out.print("<tr>");
			for(int i = 1 ; i<=num ; i++) {
				out.print("<td>"+i+"</td>");
			}
			out.print("</tr>");
			out.print("</table>");
	}

}
