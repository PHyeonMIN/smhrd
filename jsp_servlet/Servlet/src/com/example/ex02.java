package com.example;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ex02")
public class ex02 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//request.setCharacterEncoding("EUC-KR");
		
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String nick = request.getParameter("nick");
		
		
		//�ܼ�â�� ��µǴ� �Ʒ��� ������ ������ â�� ����Ͻÿ�
		response.setContentType("text/html;charset=EUC-KR");	// html�����
		PrintWriter out = response.getWriter();					// ��� �����
		out.println("����ڰ� ���� ID�� : "+id+"<br>");
		out.println("����ڰ� ���� PW�� : "+pw);
		out.println("����ڰ� ���� NICK�� : "+nick);
		//���� ����
		//����ڿ��� �Է¹��� ���� �ִٸ� �������
		// 1. �Է¹޴� HTML����
		// 2. Servlet���Ͻ���(�ڵ�)
		
	}

}
