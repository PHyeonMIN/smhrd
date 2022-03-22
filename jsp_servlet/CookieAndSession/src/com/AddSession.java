package com;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AddSession")
public class AddSession extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	// 세션의 특징
	// 1. 세션은 브라우저당 1개씩만 발급이된다. 구글과 explore 생각
	// 2. 세션은 브라우저가 닫히면 기본적으로 만료되며 브라우저를 닫지 않아도 지정해놓은 일정시간이 지나면 만료된다
	//		(지정된 시간이 따로 없다면 30분 초과시 만료)
	// 3. 세션의 시간을 지정했다고 하더라도 행동( 새로고침, 페이지이동 등 )을 하게 되면 
	// 		시간은 다시 처음부터 카운팅된다.
	// 4. 세션안에 저장할 수 있는 데이터 형태는 Object(모든걸 저장할 수 있음)
		// 쿠키는 text만
	// 5. 세션의 개수는 서버의 메모리가 가능하다면 계속해서 발급가능
		
		
		
		
		
		
		
		
		
		
		
		
		
		// 세션만드는 방법
	// 1. client의 키(쿠키)값을 가져와서 세션을 생성
	HttpSession session = request.getSession();
	// 2. session에 값을 넣는다.
	session.setAttribute("id", "hodoodady");
	// 3. session의 나이설정(초단위)
	// 페이지새로고침때마다 나이설정초기화 / 브라우저를 끝거나 시간이 다지나면 만료
	session.setMaxInactiveInterval(30);
	
	
	
	
	
	
	
	
	
	
	
	}

}
