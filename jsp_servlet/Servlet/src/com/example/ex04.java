package com.example;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex04")
public class ex04 extends HttpServlet {
//	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("service방식");
//	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		System.out.println("GET방식");
		//GET : 보안x, 보내는 데이터크기 제한 /다른 데이터전송방식에 비해 빠름
		String id = request.getParameter("id");
		System.out.println(id);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("POST방식");
		//POST : 보안강함(패킷을 통해 데이터를 전송하기 때문), 보내는 데이터크기 제한x / GET방식보다는 느림 
		request.setCharacterEncoding("utf-8");
		//POST방식일때 필수로 써줘야하는 인코딩 가능
		String id = request.getParameter("id");
		System.out.println(id);
	}

}
