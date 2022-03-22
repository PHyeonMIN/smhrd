package com.message.Front;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.inter.Command;
import com.message.DAO.memberDAO;
import com.message.DTO.memberDTO;
import com.message.member.DeleteService;
import com.message.member.JoinService;
import com.message.member.LogOutService;
import com.message.member.LoginService;
import com.message.member.UpdateService;

@WebServlet("*.do") // action -> a.do, b.do
public class FrontController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// FrontController Pattern
		// 1. 모든 요청을 하나의 Servlet로 정의하는 패턴
		// 2. 중복되는 코드나 추적, 보안을 적용할 때 하나의 Servlet에서 정의되기 때문에 유지보수에 용이

		// 문제는? 누가 호출했는지를 모름 - url로 판단
		String uri = request.getRequestURI();
		System.out.println(uri);
		String path = request.getContextPath();
		System.out.println(path);
		String command = uri.substring(path.length() + 1);
		System.out.println("요청기능 : " + command);

		Command com = null;
		String nextpage = null;
		// 업캐스팅 : 자식을 생성하는데 부모한테 담아준다.
		if (command.equals("LoginCon.do")) {
			
			com = new LoginService();
			nextpage = com.execute(request, response);
			// Command Pattern
			// 사용자의 요청을 객체인 클래스파일로 처리
			

		} else if (command.contentEquals("JoinCon.do")) {
			
			com = new JoinService();
			com.execute(request, response); 
			
		} else if (command.equals("DeleteCon.do")) {
			
			com = new DeleteService();
			nextpage = com.execute(request, response);
			
		} else if (command.equals("LogOutCon.do")) {
			
			com = new LogOutService();
			nextpage = com.execute(request, response);
			
		} else if (command.equals("UpdateCon.do")) {
			
			com = new UpdateService();
			com.execute(request, response);
			
		} else if (command.equals("check.do")) {
			// 1. 파라미터 수집
			String email = request.getParameter("email");
			// 2. DAO 객체 생성
			memberDAO dao = new memberDAO();
			// 3. DAO 객체의 메서드 사용
			boolean check = dao.CheckCon(email);
			response.setCharacterEncoding("utf-8"); // 인코딩은 printwriter객체선언 전에 할것!!!
			// 4. PrintWriter 객체 생성
			PrintWriter out = response.getWriter();

//			if(check) {
//				out.print("<p style='color:red;'>중복된아이디입니다.</p>");
//			}else {
//				out.print("중복되지않은 값입니다.");
//			}
			// 5. 응답
			out.print(check);

		}else if(command.equals("searchMember.do")) {
			String text = request.getParameter("email");
			memberDAO dao = new memberDAO();
			ArrayList<memberDTO> list = dao.searchMember(text);
			
			Gson gson = new Gson();
			String json = gson.toJson(list);
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			out.print(json);
		}
		if(nextpage!=null) {
			response.sendRedirect(nextpage);
		}
		// 페이지이동은 클래스파일이 아니라 frontcontroller에서 할 것
	}

}
