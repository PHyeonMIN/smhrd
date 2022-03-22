package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex01sum")
public class ex01sum extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// request.setCharacterEncoding() ----> 받아오는 값을 처리하기 위한 것
		// 1. 파라미터 수집 : 받아온 데이터들을 변수에  넣어서 저장
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
	
		// 13과 15의 합은 28입니다
		String result = num1+"과 "+num2+"의 합은 "+(num1+num2)+"입니다.";
	
		// Ajax통신에서 값을 돌려줄 때 ,  PrintWriter 객체 사용
		// 2. 인코딩
		// Ajax는 response.setContentType("text/html; charset=eur-kr"); 방식보다
		response.setCharacterEncoding("utf-8");
	
		//PrintWriter 객체 생성
		PrintWriter out = response.getWriter();
		
		// 결과 값 전송
		out.print(result+"<br>");
	
	
	}

}
