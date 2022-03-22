package com.example;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex03")
public class ex03 extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. 사용자가 입력한 값을 가져오기
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		String cal = request.getParameter("cal");

		response.setContentType("text/html;charset=EUC-KR");
		PrintWriter out = response.getWriter();
		if (cal.equals("+")) {
			out.print(num1 + "+" + num2 + "=" + (num1 + num2));
		} else if (cal.equals("-")) {
			out.print(num1 + "-" + num2 + "=" + (num1 - num2));
		} else if (cal.equals("*")) {
			out.print(num1 + "*" + num2 + "=" + (num1 * num2));
		} else if (cal.equals("/")) {
			out.print(num1 + "/" + num2 + "=" + (num1 / (float)num2));
		}
	}

}
