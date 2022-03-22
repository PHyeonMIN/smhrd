package com.example;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex01")

public class ex01 extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Servlet : Server + Applet
		// ������ ����� �������α׷��� ������
		// Java -> main()Hello / Servlet -> service()
		// �� IP �ּ� : 172.30.1.27

		System.out.println("������ �����ߴ�.");

		// request : ������ �����ϴ� ������� ������ ����ִ� ��ü
		String ip = request.getRemoteAddr();
		System.out.println("������ ������� IP : " + ip);

		// response : ������ ����ڿ��� ������ �� �ְ� ���ִ� ��ü
		// 1. html�� �������
		response.setContentType("text/html;charset=utf-8");
		// ���ڷθ������ html
		// 2. ��θ� �������
		PrintWriter out = response.getWriter();
		
		
		
		out.print("Hello");
		// ������ IP�� '172.30.1.17' ��������
		// "������ ȯ���մϴ�" ���
		if (ip.equals("172.30.1.35")) {
			out.println("������ ȯ���մϴ�.");
		}
		// ������ IP�� �����̾�����
		// "����"ȯ���մϴ�"���
		else if (ip.equals("172.30.1.47") || ip.equals("172.30.1.48")){
			out.println("30���� �Ѵ޳����̽��ϴ� ����");
		}
		else if(ip.equals("172.30.1.38")){
			out.println("���� �󸥰�����");
		}
		else {
			out.println("�մ� ȯ���մϴ�.");
		}
	}

}
